//
//  ActionViewAssembly.swift
//  VISCSExample
//
//  Created by Brody Robertson
//  
//

import OSKit
import Resolver

public struct ActionViewAssembly: IModuleAssembly {
    
    public func assemble(container: IDependencyContainer) {
        
        guard let container = container as? Resolver else {
            return
        }
        
        // ViewController registration used to resolve all named instances
        container.register {
            ActionViewController.initWithStoryboard()
        }
        
        // ActionViewInteractor
        container.register { _, args in
            ActionViewInteractor(coordinator: args())
        }
        
    }
    
}
