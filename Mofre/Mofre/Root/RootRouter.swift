//
//  RootRouter.swift
//  Mofre
//
//  Created by Hien Vo Minh on 12/1/19.
//  Copyright © 2019 Vomh. All rights reserved.
//

import UIKit

final class RootRouter: NSObject {

  private let window = UIWindow(frame: UIScreen.main.bounds)

  func activate() {
    window.rootViewController = BaseViewController()
    window.makeKeyAndVisible()
  }

}
