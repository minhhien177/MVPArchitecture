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

final class RootRouter: MVPRouter {
  private let window = RootView(frame: UIScreen.main.bounds)
  private let presenter = RootPresenter()
  private let pool = Container()

  init() {
    super.init(view: window, presenter: presenter)
  }

  func activate() {
    let postsRouter = PostsRouter()
    window.rootViewController = postsRouter.viewController
    window.makeKeyAndVisible()
    route(to: postsRouter, mode: .push)
  }

  override var servicesPool: Container? {
    return pool
  }
}
