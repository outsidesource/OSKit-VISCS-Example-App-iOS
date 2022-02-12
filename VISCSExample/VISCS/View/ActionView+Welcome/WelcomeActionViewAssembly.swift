//
//  WelcomeActionViewAssembly.swift
//  VISCSExample
//
//  Created by Brody Robertson
//  Copyright © 2022 Outside Source. All rights reserved.
//

import OSKit
import Resolver

public extension Resolver.Name {
    static let welcomeActionView = Self("welcomeActionView")
}

public struct WelcomeActionViewAssembly: IModuleAssembly {
    
    public func assemble(container: IDependencyContainer) {
        
        guard let container = container as? Resolver else {
            return
        }
        
        // Welcome ActionViewController
        container.register(name: .welcomeActionView) { resolver in
            resolver.resolve(ActionViewController.self)
        }
        .resolveProperties { resolver, viewController, args in
            
            // Resolve Interactor
            let viewInteractor = resolver.resolve(ActionViewInteractor.self, name: .welcomeActionView, args: args)

            // Inject ViewController Properties
            viewController.stateStore = viewInteractor.stateStore
            viewController.actionViewDelegate = viewInteractor
            
        }
        
        // Welcome ActionViewInteractor
        container.register(name: .welcomeActionView) { (_, args) -> ActionViewInteractor in
            ActionViewInteractor(state: .welcome, name: .welcome, coordinator: args())
        }
        
    }
    
}
