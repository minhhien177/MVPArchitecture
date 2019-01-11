//
//  MVPRouter.swift
//  MVPArchitecture
//
//  Created by Hien Vo Minh on 29/9/18.
//  Copyright © 2018 vomh. All rights reserved.
//

import RxSwift

open class MVPRouter<Pool>: Hashable {
  public let hashValue = Int(arc4random())

  private let presenter: MVPPresentable
  private weak var parent: MVPRouter?
  private var children = Set<MVPRouter>()

  public typealias AfterDetachClosure = (MVPRouter) -> Void
  private var afterDetachClosure: AfterDetachClosure?

  public init(view: MVPViewable,
              presenter: MVPPresentable) {
    self.presenter = presenter

    view.viewableEventStream.subscribe(onNext: { [weak presenter] event in
      presenter?.handle(viewableEvent: event)
    }).disposed(by: view.disposeBag)

    presenter.contentableEventStream.subscribe(onNext: { [weak view] event in
      view?.handle(contentableEvent: event)
    }).disposed(by: view.disposeBag)

    presenter.routableEventStream.subscribe(onNext: { [weak self] event in
      self?.handle(routingEvent: event)
    }).disposed(by: view.disposeBag)
  }

  open func handle(routingEvent: Any) { }

  public func attach(_ router: MVPRouter, afterDetachClosure: AfterDetachClosure? = nil) {
    router.parent = self
    children.insert(router)
    router.afterDetachClosure = afterDetachClosure
  }

  public func detach(_ router: MVPRouter) {
    children.remove(router)
    router.parent = nil
    router.afterDetachClosure?(router)
  }

  public func detachSelf() {
    guard let parent = parent else { return }
    parent.children.remove(self)
    self.parent = nil
    afterDetachClosure?(self)
  }

  open var pool: Pool {
    guard let pool = parent?.pool else {
      fatalError("pool is available after router is attached")
    }
    return pool
  }

  public static func == (lhs: MVPRouter, rhs: MVPRouter) -> Bool {
    return lhs.hashValue == rhs.hashValue
  }

}
