//
//  HomeRouter.swift
//  Mofre
//
//  Created by Hien Vo Minh on 12/1/19.
//  Copyright © 2019 Vomh. All rights reserved.
//

import Controller

final class HomeRouter: BaseRouter {

  let viewController = HomeViewController()

  init() {
    super.init(
      view: viewController,
      presenter: HomePresenter())
  }

}
