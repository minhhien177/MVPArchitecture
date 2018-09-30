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

  init(servicesPool: MVPServicesPool) {
    viewController = PostsViewController(nibName: nil, bundle: nil)
    let interactor = DefaultPostsInteractor(servicesPool: servicesPool)
    let presenter = PostsPresenter(interactor: interactor)
    super.init(view: viewController,
               presenter: presenter)
  }

}
