//
//  MVPView.swift
//  MVPArchitecture
//
//  Created by Hien Vo Minh on 29/9/18.
//  Copyright © 2018 vomh. All rights reserved.
//

import RxSwift

public protocol MVPViewable: class {
  var viewableEventStream: Observable<Any> { get }
  func handle(contentableEvent: Any)
  var disposeBag: DisposeBag { get }
}

public protocol MVPView: MVPViewable {
  associatedtype ViewEvent
  associatedtype ContentEvent
  var viewEventStream: Observable<ViewEvent> { get }
  func handle(contentEvent: ContentEvent)
}

public extension MVPView {
  public var viewableEventStream: Observable<Any> {
    return viewEventStream.map { $0 }.asObservable()
  }

  func handle(contentableEvent: Any) {
    guard let contentEvent = contentableEvent as? ContentEvent else { return }
    handle(contentEvent: contentEvent)
  }
}
