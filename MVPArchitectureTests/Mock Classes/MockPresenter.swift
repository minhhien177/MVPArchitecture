//
//  MockPresenter.swift
//  MVPArchitectureTests
//
//  Created by MinhHien Vo on 19/1/19.
//  Copyright © 2019 vomh. All rights reserved.
//

@testable import MVPArchitecture
import RxSwift

final class MockPresenter {
}

enum ViewEvent { }
enum ContentEvent { }
enum RoutingEvent { }

extension MockPresenter: MVPPresenter {
  func handle(viewEvent: ViewEvent) { }
  var contentEventStream: Observable<ContentEvent> { return .never() }
  var routingEventStream: Observable<RoutingEvent> { return .never() }
}
