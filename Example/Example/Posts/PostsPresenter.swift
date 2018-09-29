//
//  PostsPresenter.swift
//  Example
//
//  Created by Hien Vo Minh on 29/9/18.
//  Copyright © 2018 vomh. All rights reserved.
//

import RxSwift
import RxCocoa

final class PostsPresenter: PostsRouter.Presenter {

  private let contentPublish = PublishRelay<PostsRouter.ContentEvent>()

  override func handle(viewEvent event: PostsRouter.ViewEvent) {
    switch event {
    case .centerButtonTap:
      let title = String(arc4random())
      contentPublish.accept(.updateTitle(title: title))
    }
  }

  override var contentStream: Observable<PostsRouter.ContentEvent> {
    return contentPublish.asObservable()
  }

}
