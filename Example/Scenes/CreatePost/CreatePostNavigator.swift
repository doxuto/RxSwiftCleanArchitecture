//
// Created by sergdort on 19/02/2017.
// Copyright (c) 2017 sergdort. All rights reserved.
//


import Foundation
import UIKit

protocol CreatePostNavigator {

    func toPosts()
}

class DefaultCreatePostNavigator: CreatePostNavigator {
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func toPosts() {
        navigationController.dismiss(animated: true)
    }
}
