//
//  HomePresenter.swift
//  Controller
//
//  Created by Hien Vo Minh on 12/1/19.
//  Copyright © 2019 Vomh. All rights reserved.
//

import MVPArchitecture
import RxSwift

public final class HomePresenter {
  public init() {}
}

extension HomePresenter: MVPPresenter {
  public func handle(viewEvent: HomeBridge.ViewEvent) { }
  public var contentEventStream: Observable<HomeBridge.ContentEvent> { return .never() }
  public var routingEventStream: Observable<HomeBridge.RoutingEvent> { return .never() }
}
