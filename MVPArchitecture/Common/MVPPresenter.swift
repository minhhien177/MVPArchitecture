//
//  MVPPresenter.swift
//  MVPArchitecture
//
//  Created by Hien Vo Minh on 29/9/18.
//  Copyright © 2018 vomh. All rights reserved.
//

import RxSwift
import RxCocoa

public protocol MVPPresentable: class {
  func handle(viewableEvent: Any)
  var contentableEventStream: Observable<Any> { get }
  var routableEventStream: Observable<Any> { get }
}

public protocol MVPPresenter: MVPPresentable {
  associatedtype ViewEvent
  associatedtype ContentEvent
  associatedtype RoutingEvent

  func handle(viewEvent: ViewEvent)
  var contentEventStream: Observable<ContentEvent> { get }
  var routingEventStream: Observable<RoutingEvent> { get }
}

public extension MVPPresenter {
  func handle(viewableEvent: Any) {
    guard let viewEvent = viewableEvent as? ViewEvent else { return }
    handle(viewEvent: viewEvent)
  }

  var contentableEventStream: Observable<Any> {
    return contentEventStream.map { $0 }.asObservable()
  }

  var routableEventStream: Observable<Any> {
    return routingEventStream.map { $0 }.asObservable()
  }
}
