//
//  PostsRouter.swift
//  Example
//
//  Created by Hien Vo Minh on 29/9/18.
//  Copyright © 2018 vomh. All rights reserved.
//

import MVPArchitecture

final class PostsRouter: MVPRouter<ServicesPool> {

  let viewController: PostsViewController

  init(servicesPool: ServicesPool) {
    viewController = PostsViewController(nibName: nil, bundle: nil)
    let interactor = DefaultPostsInteractor(servicesPool: servicesPool)
    let presenter = PostsPresenter(interactor: interactor)
    super.init(view: viewController,
               presenter: presenter)
  }

}
