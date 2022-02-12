//
//  DeviceCoordinatorAssembly.swift
//  VISCSExample
//
//  Created by Brody Robertson
//  Copyright © 2022 Outside Source. All rights reserved.
//

import OSKit
import Resolver

public struct DeviceSetupCoordinatorAssembly: IModuleAssembly {
    
    public func assemble(container: IDependencyContainer) {
        
        guard let container = container as? Resolver else {
            return
        }
        
        container.register {
            DeviceSetupCoordinator(initialRoute: .deviceView)
        }
        
    }
    
}
