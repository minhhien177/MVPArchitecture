//
//  PostsInteractor.swift
//  Example
//
//  Created by Hien Vo Minh on 30/9/18.
//  Copyright © 2018 vomh. All rights reserved.
//

import MVPArchitecture

protocol PostsInteractor: class {
}

final class DefaultPostsInteractor: PostsInteractor {
  private weak var servicesPool: ServicesPool?

  init(servicesPool: ServicesPool) {
    self.servicesPool = servicesPool
  }
}
