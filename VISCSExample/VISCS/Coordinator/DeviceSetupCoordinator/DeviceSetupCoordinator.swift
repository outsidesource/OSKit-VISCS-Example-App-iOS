//
//  DeviceCoordinator.swift
//  VISCSExample
//
//  Created by Brody Robertson
//  Copyright © 2022 Outside Source. All rights reserved.
//

import OSKit
import XCoordinator
import Resolver

public enum DeviceSetupRoute: Route {
    case deviceView
    case presentAlert(Presentable)
    case dismiss
}

public class DeviceSetupCoordinator: NavigationCoordinator<DeviceSetupRoute> {
    
    deinit {
        OSLog.debug()
    }
    
    override public func prepareTransition(for route: DeviceSetupRoute) -> NavigationTransition {

        switch route {
        case .deviceView:
            let presentable = Resolver.resolve(DeviceViewController.self, args: self)
            return .set([presentable])
        
        case .presentAlert(let presentable):
            return .present(presentable)
            
        case .dismiss:
            return .dismissToRoot()
        }

    }
    
}

extension DeviceSetupCoordinator: IDeviceViewCoordinator {
    
    public func didCompletePrimaryAction(_ interactor: DeviceViewInteractor) {
        self.trigger(.dismiss)
    }
    
    public func presentAlert(_ viewController: UIViewController) {
        self.trigger(.presentAlert(viewController))
    }

}
