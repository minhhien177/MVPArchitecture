//
//  RootRouter.swift
//  Mofre
//
//  Created by Hien Vo Minh on 12/1/19.
//  Copyright © 2019 Vomh. All rights reserved.
//

import UIKit
import MVPArchitecture
import Controller
import RxSwift

typealias BaseRouter = MVPRouter<ServicesPool>

final class RootRouter: BaseRouter {

  private let window = RootWindow(frame: UIScreen.main.bounds)
  private let servicesBag = ServicesBag()

  init() {
    super.init(
      view: window,
      presenter: RootPresenter())
  }

  func activate() {
    window.rootViewController = BaseViewController()
    window.makeKeyAndVisible()
  }

  override var pool: ServicesPool {
    return servicesBag.pool
  }

}

private final class RootWindow: UIWindow, MVPView {
  let disposeBag = DisposeBag()
  var viewEventStream: Observable<Void> { return .never() }
  func handle(contentEvent: Void) { }
}

private final class RootPresenter: MVPPresenter {
  func handle(viewEvent: Void) { }
  var contentEventStream: Observable<Void> { return .never() }
  var routingEventStream: Observable<Void> { return .never() }
}
