//
//  DeviceViewAssembly.swift
//  VISCSExample
//
//  Created by Brody Robertson
//  
//

import OSKit
import Resolver

public extension Resolver.Name {
    static let deviceView = Self("deviceView")
}

public struct DeviceViewAssembly: IModuleAssembly {
    
    public func assemble(container: IDependencyContainer) {
        
        guard let container = container as? Resolver else {
            return
        }
        
        container.register { resolver in
            DeviceViewController.initWithStoryboard()
        }
        .resolveProperties { resolver, viewController, args in
            
            let viewInteractor = resolver.resolve(DeviceViewInteractor.self, args: args)
            viewController.stateStore = viewInteractor.stateStore
            viewController.actionViewDelegate = viewInteractor
            
        }
        
        container.register { (resolver, args) -> DeviceViewInteractor in
            
            // Normally the Device OR DeviceInteractor might be passed as arg
            let device = Device()
            let deviceInteractor = resolver.resolve(DeviceInteractor.self, args: device)
            
            return DeviceViewInteractor(coordinator: args(), deviceInteractor: deviceInteractor)
            
        }
        
        
    }
    
}
