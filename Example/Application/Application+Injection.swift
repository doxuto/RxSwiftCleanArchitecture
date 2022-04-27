//
//  Application+Injection.swift
//  Example
//
//  Created by doxuto on 09/05/2022.
//

import Foundation
import Resolver
import RealmPlatform
import NetworkPlatform
import CoreDataPlatform
import Domain
import UIKit

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        
        registerAllProviders()
        
        registerAllStoryboard()
        
        registerAllNavigationViewControllers()
    }
    
    public static func registerAllProviders() {
        register { RealmPlatform.UseCaseProvider() }
            .implements(Domain.UseCaseProvider.self, name: .realmProvider)
        
        register { NetworkPlatform.UseCaseProvider() }
            .implements(Domain.UseCaseProvider.self, name: .networkProvider)

        register { CoreDataPlatform.UseCaseProvider() }
            .implements(Domain.UseCaseProvider.self, name: .coreDataProvider)
    }
    
    public static func registerAllStoryboard() {
        register { UIStoryboard(name: "Main", bundle: nil) }
            .implements(UIStoryboard.self, name: .mainStoryboard)
            .scope(.application)
    }
    
    public static func registerAllNavigationViewControllers() {
        
        register { UINavigationController() }
            .implements(UINavigationController.self, name: .coreDataNavigation)
        
        register { UINavigationController() }
            .implements(UINavigationController.self, name: .networkNavigation)
        
        register { UINavigationController() }
            .implements(UINavigationController.self, name: .realmNavigation)
        
    }
}

extension Resolver.Name {
    static let mainStoryboard: Resolver.Name = Resolver.Name("Main")
    static let coreDataNavigation: Resolver.Name = Resolver.Name("coreDataNavigation")
    static let realmNavigation: Resolver.Name = Resolver.Name("realmNavigation")
    static let networkNavigation: Resolver.Name = Resolver.Name("networkNavigation")
    
    static let networkProvider: Resolver.Name = Resolver.Name("networkProvider")
    static let realmProvider: Resolver.Name = Resolver.Name("realmProvider")
    static let coreDataProvider: Resolver.Name = Resolver.Name("coreDataProvider")
    
    static let postCoreDataNavigator: Resolver.Name = Resolver.Name("postCoreDataNavigator")
    static let postRealmNavigator: Resolver.Name = Resolver.Name("postRealmNavigator")
    static let postNetworkNavigator: Resolver.Name = Resolver.Name("postNetworkNavigator")
}
