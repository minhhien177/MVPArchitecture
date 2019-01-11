//
//  ServicesPool.swift
//  Mofre
//
//  Created by Hien Vo Minh on 12/1/19.
//  Copyright © 2019 Vomh. All rights reserved.
//

import Swinject

public typealias ServicesPool = Container

extension ServicesPool {
  func resolve<Service>() -> Service {
    if let service = resolve(Service.self, name: nil) {
      return service
    } else {
      fatalError()
    }
  }
}
