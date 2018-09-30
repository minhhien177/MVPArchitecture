//
//  RootPresenter.swift
//  Example
//
//  Created by Hien Vo Minh on 30/9/18.
//  Copyright © 2018 vomh. All rights reserved.
//

import MVPArchitecture
import RxSwift

final class RootPresenter: MVPPresenter {
  func handle(viewEvent: Void) { }
  var contentEventStream: Observable<Void> { return .never() }
  var routingEventStream: Observable<Void> { return .never() }
}
