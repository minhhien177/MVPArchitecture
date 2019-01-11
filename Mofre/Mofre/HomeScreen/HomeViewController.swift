//
//  HomeViewController.swift
//  Mofre
//
//  Created by Hien Vo Minh on 12/1/19.
//  Copyright © 2019 Vomh. All rights reserved.
//

import UIKit
import MVPArchitecture
import Controller
import RxSwift

class HomeViewController: BaseViewController {

  let disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()
  }

}

extension HomeViewController: MVPView {
  var viewEventStream: Observable<HomeBridge.ViewEvent> { return .never() }
  func handle(contentEvent: HomeBridge.ContentEvent) { }
}
