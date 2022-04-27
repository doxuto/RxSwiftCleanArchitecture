import Foundation
import UIKit
import Domain
import RealmPlatform
import NetworkPlatform
import CoreDataPlatform
import Resolver

class Application {
    static let shared = Application()
    
    @Injected var coreDataUseCaseProvider: CoreDataPlatform.UseCaseProvider
    @Injected var realmUseCaseProvider: RealmPlatform.UseCaseProvider
    @Injected var networkUseCaseProvider: NetworkPlatform.UseCaseProvider
    
    private init() {}
    
    func configureMainInterface(in window: UIWindow?) {
        let storyboard = Resolver.resolve(UIStoryboard.self)
        let cdNavigationController = Resolver.resolve(UINavigationController.self, name: .coreDataNavigation)
        cdNavigationController.tabBarItem = UITabBarItem(title: "CoreData",
                                                         image: UIImage(named: "Box"),
                                                         selectedImage: nil)
        let cdNavigator = DefaultPostsNavigator(services: coreDataUseCaseProvider,
                                                navigationController: cdNavigationController,
                                                storyBoard: storyboard)
        
        let rmNavigationController = Resolver.resolve(UINavigationController.self, name: .realmNavigation)
        rmNavigationController.tabBarItem = UITabBarItem(title: "Realm",
                                                         image: UIImage(named: "Toolbox"),
                                                         selectedImage: nil)
        let rmNavigator = DefaultPostsNavigator(services: realmUseCaseProvider,
                                                navigationController: rmNavigationController,
                                                storyBoard: storyboard)
        
        let networkNavigationController = Resolver.resolve(UINavigationController.self, name: .networkNavigation)
        networkNavigationController.tabBarItem = UITabBarItem(title: "Network",
                                                              image: UIImage(named: "Toolbox"),
                                                              selectedImage: nil)
        let networkNavigator = DefaultPostsNavigator(services: networkUseCaseProvider,
                                                     navigationController: networkNavigationController,
                                                     storyBoard: storyboard)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            cdNavigationController,
            rmNavigationController,
            networkNavigationController
        ]
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        cdNavigator.toPosts()
        rmNavigator.toPosts()
        networkNavigator.toPosts()
    }

}
