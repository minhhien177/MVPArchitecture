//
//  RootRouter.swift
//  Example
//
//  Created by Hien Vo Minh on 30/9/18.
//  Copyright © 2018 vomh. All rights reserved.
//

import UIKit
import MVPArchitecture
import Swinject

public typealias ServicesPool = Container

public extension ServicesPool {
  func resolve<Service>() -> Service? {
    return resolve(Service.self, name: nil)
  }
}

final class RootRouter: MVPRouter<ServicesPool> {
  private let window = RootView(frame: UIScreen.main.bounds)
  private let presenter = RootPresenter()
  private let servicePool = ServicesPool()
  private let randomNumberService: RandomNumberService

  init() {
    randomNumberService = DefaultRandomNumberService()
    super.init(view: window, presenter: presenter)
    setUpPool()
  }

  private func setUpPool() {
    pool.register(RandomNumberService.self) { [weak self] _ in
      return self?.randomNumberService ?? DefaultRandomNumberService()
    }
  }

  func activate() {
    let postsRouter = PostsRouter(servicesPool: pool)
    window.rootViewController = postsRouter.viewController
    window.makeKeyAndVisible()
    attach(postsRouter) { [weak window] _ in
      window?.rootViewController = nil
    }
  }

  override var pool: ServicesPool {
    return servicePool
  }
}
