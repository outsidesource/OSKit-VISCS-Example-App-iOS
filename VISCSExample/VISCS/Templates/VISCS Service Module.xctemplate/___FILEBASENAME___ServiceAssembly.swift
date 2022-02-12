//
//  ___VARIABLE_productName___ServiceAssembly.swift
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import OSKit
import Resolver

public struct ___VARIABLE_productName___ServiceAssembly: IModuleAssembly {
    
    public func assemble(container: IDependencyContainer) {
        
        guard let container = container as? Resolver else {
            return
        }
        
        container.register {
            ___VARIABLE_productName___Service()
        }
        .implements(I___VARIABLE_productName___Service.self)
        
    }
    
}
