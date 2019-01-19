//
//  MVPRouterTests.swift
//  MVPArchitectureTests
//
//  Created by MinhHien Vo on 19/1/19.
//  Copyright © 2019 vomh. All rights reserved.
//

@testable import MVPArchitecture
import Quick
import Nimble

final class MVPRouterTests: QuickSpec {
  override func spec() {
    super.spec()
    
    var view: MockView!
    var presenter: MockPresenter!
    var router: MVPRouter<MockPool>!

    beforeEach {
      view = MockView()
      presenter = MockPresenter()
      router = MVPRouter<MockPool>(
        view: view,
        presenter: presenter)
    }
    
    describe("pool") {
      var parentRouter: MockRouter!
      
      beforeEach {
        parentRouter = MockRouter()
        parentRouter.attach(router)
      }
      
      it("should return pool from its parent") {
        expect(router.pool) == parentRouter.pool
      }
    }
  }
}
