//
//  PostsRouter.swift
//  Example
//
//  Created by Hien Vo Minh on 29/9/18.
//  Copyright © 2018 vomh. All rights reserved.
//

import MVPArchitecture

final class PostsRouter: PostsRouter.Router {
  enum ViewEvent {
    case centerButtonTap
  }

  enum ContentEvent {
    case updateTitle(title: String)
  }

  typealias Presenter = MVPPresenter<ViewEvent, ContentEvent>
  typealias Router = MVPRouter<ViewEvent, ContentEvent>

  let viewController: PostsViewController

  init() {
    viewController = PostsViewController(nibName: nil, bundle: nil)
    super.init(view: viewController,
               presenter: PostsPresenter())
  }

}
