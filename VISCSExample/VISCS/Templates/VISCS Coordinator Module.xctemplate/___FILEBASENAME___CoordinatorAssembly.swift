//
//  ___VARIABLE_productName___CoordinatorAssembly.swift
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import OSKit
import Resolver

public struct ___VARIABLE_productName___CoordinatorAssembly: IModuleAssembly {
    
    public func assemble(container: IDependencyContainer) {
        
        guard let container = container as? Resolver else {
            return
        }
        
        container.register {
            ___VARIABLE_productName___Coordinator(initialRoute: .initial)
        }
        
    }
    
}
