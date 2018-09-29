//
//  MVPView.swift
//  MVPArchitecture
//
//  Created by Hien Vo Minh on 29/9/18.
//  Copyright © 2018 vomh. All rights reserved.
//

import RxSwift

public protocol MVPView: class {
  func getViewEventStream<ViewEvent>() -> Observable<ViewEvent>
  func handle<ContentEvent>(contentEvent: ContentEvent)
}
