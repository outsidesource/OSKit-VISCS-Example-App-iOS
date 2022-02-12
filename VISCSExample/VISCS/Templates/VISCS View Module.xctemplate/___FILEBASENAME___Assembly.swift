//
//  ___VARIABLE_productName___Assembly.swift
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import OSKit
import Resolver

public struct ___VARIABLE_productName___Assembly: IModuleAssembly {
    
    public func assemble(container: IDependencyContainer) {
        
        guard let container = container as? Resolver else {
            return
        }
        
        container.register { resolver in
            ___VARIABLE_productName___Controller.initWithStoryboard()
        }
        .resolveProperties { resolver, viewController, args in
            
            let viewInteractor = resolver.resolve(___VARIABLE_productName___Interactor.self, args: args)
            viewController.stateStore = viewInteractor.stateStore
            viewController.___VARIABLE_variableName___Delegate = viewInteractor
            
        }
        
        container.register { (resolver, args) -> ___VARIABLE_productName___Interactor in
            return ___VARIABLE_productName___Interactor(coordinator: args())
        }
        
    }
    
}
