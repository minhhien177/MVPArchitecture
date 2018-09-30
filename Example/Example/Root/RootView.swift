//
//  RootView.swift
//  Example
//
//  Created by Hien Vo Minh on 30/9/18.
//  Copyright © 2018 vomh. All rights reserved.
//

import UIKit
import MVPArchitecture
import RxSwift

final class RootView: UIWindow {
  let disposeBag = DisposeBag()
}

extension RootView: MVPView {
  var viewEventStream: Observable<Void> { return .never() }
  func handle(contentEvent: Void) { }
}
