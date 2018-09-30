//
//  PostsSpec.swift
//  Example
//
//  Created by Hien Vo Minh on 30/9/18.
//  Copyright © 2018 vomh. All rights reserved.
//

import MVPArchitecture

enum PostsSpec {
  enum ViewEvent {
    case centerButtonTap
  }

  enum ContentEvent {
    case updateTitle(title: String)
  }

  typealias RoutingEvent = Void
}
