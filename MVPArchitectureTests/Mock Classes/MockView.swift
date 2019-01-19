//
//  MockView.swift
//  MVPArchitectureTests
//
//  Created by MinhHien Vo on 19/1/19.
//  Copyright © 2019 vomh. All rights reserved.
//

@testable import MVPArchitecture
import RxSwift

final class MockView {
}

extension MockView: MVPView {
  var viewEventStream: Observable<ViewEvent> { return .never() }
  func handle(contentEvent: ContentEvent) { }
}
