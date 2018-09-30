//
//  MVPServicesPool.swift
//  MVPArchitecture
//
//  Created by Hien Vo Minh on 30/9/18.
//

import Swinject

public typealias MVPServicesPool = Container

public extension MVPServicesPool {
  func resolve<Service>() -> Service? {
    return resolve(Service.self, name: nil)
  }
}
