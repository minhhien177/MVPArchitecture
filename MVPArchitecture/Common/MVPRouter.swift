//
//  MVPRouter.swift
//  MVPArchitecture
//
//  Created by Hien Vo Minh on 29/9/18.
//  Copyright © 2018 vomh. All rights reserved.
//

import RxSwift

open class MVPRouter<ViewEvent, ContentEvent> {

  public let disposeBag = DisposeBag()
  private let presenter: MVPPresenter<ViewEvent, ContentEvent>

  public init(view: MVPView,
              presenter: MVPPresenter<ViewEvent, ContentEvent>) {
    self.presenter = presenter

    view.getViewEventStream().subscribe(onNext: { [unowned presenter] event in
      presenter.handle(viewEvent: event)
    }).disposed(by: disposeBag)

    presenter.contentStream.subscribe(onNext: { [unowned view] event in
      view.handle(contentEvent: event)
    }).disposed(by: disposeBag)
  }

}
