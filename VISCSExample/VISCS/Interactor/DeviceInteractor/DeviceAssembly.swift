//
//  DeviceInteractorAssembly.swift
//  VISCSExample
//
//  Created by Brody Robertson
//  Copyright © 2022 Outside Source. All rights reserved.
//

import OSKit
import Resolver

public struct DeviceAssembly: IModuleAssembly {
    
    public func assemble(container: IDependencyContainer) {
        
        guard let container = container as? Resolver else {
            return
        }
        
        container.register { resolver, args in
            DeviceInteractor(device: args(), connectionInteractor: resolver.resolve(args: args()))
        }
        // Typically this would not be application scope but we have simplified this for example
        .scope(.application)
        
    }
    
}

