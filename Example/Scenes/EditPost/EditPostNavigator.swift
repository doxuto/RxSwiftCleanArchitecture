import Foundation
import UIKit

protocol EditPostNavigator {
    func toPosts()
}

class DefaultEditPostNavigator: EditPostNavigator {
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func toPosts() {
        navigationController.popViewController(animated: true)
    }
}
