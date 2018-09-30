//
//  PostsInteractor.swift
//  Example
//
//  Created by Hien Vo Minh on 30/9/18.
//  Copyright © 2018 vomh. All rights reserved.
//

import MVPArchitecture

protocol PostsInteractor: class {
  func fetchRandomNumber() -> Int
}

final class DefaultPostsInteractor: PostsInteractor {
  private let randomNumberService: RandomNumberService!

  init(servicesPool: ServicesPool) {
    self.randomNumberService = servicesPool.resolve()
  }

  func fetchRandomNumber() -> Int {
    return randomNumberService.fetchRandomNumber()
  }
}
