//
//  ModuleAssemblerConfig+App.swift
//  VISCSExample
//
//  Created by Brody Robertson
//  Copyright © 2022 Outside Source. All rights reserved.
//

import OSKit

extension ModuleAssemblerConfig {
    
    public static var current: [ModuleAssemblerConfig] {
        
        #if DEBUG
        return self.debug
        #else
        return self.default
        #endif
        
    }
    
    /// All Default Configs
    private static let `default`: [ModuleAssemblerConfig] = [.defaultService, .defaultInteractor, .defaultView, .defaultCoordinator]
    private static let debug: [ModuleAssemblerConfig] = [.debugService, .defaultInteractor, .defaultView, .defaultCoordinator]
    
    /// Service Configs
    private static let defaultService: ModuleAssemblerConfig = ModuleAssemblerConfig(name: "Default Service", moduleAssemblies: [DeviceConnectionServiceAssembly()])
    private static let debugService: ModuleAssemblerConfig = ModuleAssemblerConfig(name: "Debug Service", moduleAssemblies: [DeviceConnectionServiceAssembly()])
    
    /// Interactor Configs
    private static let defaultInteractor: ModuleAssemblerConfig = ModuleAssemblerConfig(name: "Default Interactor", moduleAssemblies: [AppAssembly(), DeviceAssembly(), DeviceConnectionAssembly()])
    
    /// View Configs
    private static let defaultView: ModuleAssemblerConfig = ModuleAssemblerConfig(name: "Default View", moduleAssemblies: [ActionViewAssembly(), WelcomeActionViewAssembly(), IntroActionViewAssembly(), DeviceViewAssembly()])
    
    /// Coordinator Configs
    private static let defaultCoordinator: ModuleAssemblerConfig = ModuleAssemblerConfig(name: "Default Coordinator", moduleAssemblies: [AppCoordinatorAssembly(), DeviceSetupCoordinatorAssembly()])
    
}
