//
//  MVPPresenter.swift
//  MVPArchitecture
//
//  Created by Hien Vo Minh on 29/9/18.
//  Copyright © 2018 vomh. All rights reserved.
//

import RxSwift
import RxCocoa

open class MVPPresenter<ViewEvent, ContentEvent> {

  public init() { }

  private let disposeBag = DisposeBag()

  open func handle(viewEvent: ViewEvent) {
    // Need override
  }

  open var contentStream: Observable<ContentEvent> {
    // Need override
    return .never()
  }

}
