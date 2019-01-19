//
//  MockRouter.swift
//  MVPArchitectureTests
//
//  Created by MinhHien Vo on 19/1/19.
//  Copyright © 2019 vomh. All rights reserved.
//

@testable import MVPArchitecture

final class MockRouter: MVPRouter<MockPool> {
  let basePool = MockPool()
  
  init() {
    super.init(
      view: MockView(),
      presenter: MockPresenter())
  }
  
  override var pool: MockPool {
    return basePool
  }
}
