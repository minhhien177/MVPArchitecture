//
//  MVPRouter.swift
//  MVPArchitecture
//
//  Created by Hien Vo Minh on 29/9/18.
//  Copyright © 2018 vomh. All rights reserved.
//

import RxSwift

open class MVPRouter: Hashable {
  public let hashValue = Int(arc4random())

  private let presenter: MVPPresentable
  private weak var parent: MVPRouter?
  private var children = Set<MVPRouter>()

  public typealias BackBlock = (MVPRouter) -> Void
  private var backBlock: BackBlock?

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

  public func route(to router: MVPRouter, backBlock: @escaping BackBlock) {
    router.parent = self
    router.backBlock = backBlock
    children.insert(router)
  }

  public func unroute() {
    guard let parent = parent else { return }
    parent.children.remove(self)
    backBlock?(self)
  }

  open var servicesPool: MVPServicesPool {
    guard let parent = parent else { fatalError("ServicesPool is retrieved from parent") }
    return parent.servicesPool
  }

  public static func == (lhs: MVPRouter, rhs: MVPRouter) -> Bool {
    return lhs.hashValue == rhs.hashValue
  }

}
