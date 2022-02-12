//
//  IntroActionViewAssembly.swift
//  VISCSExample
//
//  Created by Brody Robertson
//  Copyright © 2022 Outside Source. All rights reserved.
//

import OSKit
import Resolver

public extension Resolver.Name {
    static let introActionView = Self("introActionView")
}

public struct IntroActionViewAssembly: IModuleAssembly {
    
    public func assemble(container: IDependencyContainer) {
        
        guard let container = container as? Resolver else {
            return
        }
        
        // Intro ActionViewController
        container.register(name: .introActionView) { resolver in
            resolver.resolve(ActionViewController.self)
        }
        .resolveProperties { resolver, viewController, args in
            
            // Resolve Interactor
            let viewInteractor = resolver.resolve(ActionViewInteractor.self, name: .introActionView, args: args)

            // Inject ViewController Properties
            viewController.stateStore = viewInteractor.stateStore
            viewController.actionViewDelegate = viewInteractor
            
        }
        
        // Intro ActionViewInteractor
        container.register(name: .introActionView) { (_, args) -> ActionViewInteractor in
            ActionViewInteractor(state: .intro, name: .intro, coordinator: args())
        }
        
    }
    
}
