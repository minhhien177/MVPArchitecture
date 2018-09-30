//
//  MVPRouter.swift
//  MVPArchitecture
//
//  Created by Hien Vo Minh on 29/9/18.
//  Copyright © 2018 vomh. All rights reserved.
//

import RxSwift
import Swinject

public enum MVPRoutingMode {
  case root
  case push
}

public typealias ServicesPool = Container

open class MVPRouter: Hashable {
  public let hashValue = Int(arc4random())

  private let presenter: MVPPresentable
  private weak var parent: MVPRouter?
  private var children = Set<MVPRouter>()
  private var routingMode: MVPRoutingMode?

  public static func == (lhs: MVPRouter, rhs: MVPRouter) -> Bool {
    return lhs.hashValue == rhs.hashValue
  }

  public init(view: MVPViewable,
              presenter: MVPPresentable) {
    self.presenter = presenter

    view.viewableEventStream.subscribe(onNext: { [unowned presenter] event in
      presenter.handle(viewableEvent: event)
    }).disposed(by: view.disposeBag)

    presenter.contentableEventStream.subscribe(onNext: { [unowned view] event in
      view.handle(contentableEvent: event)
    }).disposed(by: view.disposeBag)

    presenter.routableEventStream.subscribe(onNext: { [unowned self] event in
      self.handle(routingEvent: event)
    }).disposed(by: view.disposeBag)
  }

  open func handle(routingEvent: Any) { }

  public func route(to router: MVPRouter, mode: MVPRoutingMode) {
    router.parent = self
    router.routingMode = mode
    children.insert(router)
  }

  public func unroute() {
    guard let parent = parent, let mode = routingMode else { return }
    parent.children.remove(self)
    parent.routeBack(router: self, mode: mode)
  }

  open func routeBack(router: MVPRouter, mode: MVPRoutingMode) { }

  open var servicesPool: ServicesPool? {
    return parent?.servicesPool
  }

}
