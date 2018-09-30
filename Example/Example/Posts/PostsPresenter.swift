//
//  PostsPresenter.swift
//  Example
//
//  Created by Hien Vo Minh on 29/9/18.
//  Copyright © 2018 vomh. All rights reserved.
//

import MVPArchitecture
import RxSwift
import RxCocoa

final class PostsPresenter {
  private let contentPublish = PublishRelay<PostsSpec.ContentEvent>()
}

extension PostsPresenter: MVPPresenter {
  func handle(viewEvent: PostsSpec.ViewEvent) {
    switch viewEvent {
    case .centerButtonTap:
      let title = String(arc4random())
      contentPublish.accept(.updateTitle(title: title))
    }
  }

  var contentEventStream: Observable<PostsSpec.ContentEvent> {
    return contentPublish.asObservable()
  }

  var routingEventStream: Observable<Void> { return .never() }
}
