//
//  RandomNumberService.swift
//  Example
//
//  Created by Hien Vo Minh on 30/9/18.
//  Copyright © 2018 vomh. All rights reserved.
//

import Foundation

protocol RandomNumberService {
  func fetchRandomNumber() -> Int
}

final class DefaultRandomNumberService: RandomNumberService {
  func fetchRandomNumber() -> Int {
    return Int(arc4random())
  }
}
