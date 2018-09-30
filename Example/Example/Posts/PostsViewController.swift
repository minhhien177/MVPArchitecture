//
//  PostsViewController.swift
//  Example
//
//  Created by Hien Vo Minh on 29/9/18.
//  Copyright © 2018 vomh. All rights reserved.
//

import UIKit
import MVPArchitecture
import RxSwift
import RxCocoa
import SnapKit

final class PostsViewController: UIViewController {

  private let label: UILabel = UILabel()
  private let button: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("Random Number", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.addTarget(self, action: #selector(PostsViewController.buttonTap), for: .touchUpInside)
    return button
  }()

  private let viewEventPublish = PublishRelay<PostsSpec.ViewEvent>()
  let disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white

    view.addSubview(label)
    label.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(50)
      make.centerX.equalToSuperview()
    }

    view.addSubview(button)
    button.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }
  }

  @objc func buttonTap() {
    viewEventPublish.accept(.centerButtonTap)
  }

}

extension PostsViewController: MVPView {
  var viewEventStream: Observable<PostsSpec.ViewEvent> {
    return viewEventPublish.asObservable()
  }

  func handle(contentEvent: PostsSpec.ContentEvent) {
    switch contentEvent {
    case .updateTitle(let title):
      label.text = title
    }
  }
}
