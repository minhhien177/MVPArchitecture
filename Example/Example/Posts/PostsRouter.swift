//
//  PostsRouter.swift
//  Example
//
//  Created by Hien Vo Minh on 29/9/18.
//  Copyright © 2018 vomh. All rights reserved.
//

import MVPArchitecture

final class PostsRouter: MVPRouter {

  let viewController: PostsViewController

  init() {
    viewController = PostsViewController(nibName: nil, bundle: nil)
    super.init(view: viewController,
               presenter: PostsPresenter())
  }

}
