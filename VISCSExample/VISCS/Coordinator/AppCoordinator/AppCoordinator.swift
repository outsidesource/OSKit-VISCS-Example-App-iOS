//
//  AppCoordinator.swift
//  VISCSExample
//
//  Created by Brody Robertson
//  Copyright © 2022 Outside Source. All rights reserved.
//

import OSKit
import XCoordinator
import Resolver

public enum AppRoute: Route {
    case welcomeActionView
    case introActionView
    case deviceSetupCoordinator
    case pop
}

public class AppCoordinator: NavigationCoordinator<AppRoute> {
    
    override public func prepareTransition(for route: AppRoute) -> NavigationTransition {

        switch route {
        
        case .welcomeActionView:
            let presentable = Resolver.resolve(ActionViewController.self, name: .welcomeActionView, args: self)
            return .set([presentable])
        
        case .introActionView:
            let presentable = Resolver.resolve(ActionViewController.self, name: .introActionView, args: self)
            return .push(presentable)
            
        case .deviceSetupCoordinator:
            let presentable = Resolver.resolve(DeviceSetupCoordinator.self)
            presentable.viewController.isModalInPresentation = true
            return .present(presentable)
                
        case .pop:
            return .pop()
        }

    }
    
}

extension AppCoordinator: IActionViewCoordinator {
    
    public func didCompletePrimaryAction(_ interactor: ActionViewInteractor) {
        OSLog.info(domain: .interactor)
        
        guard let name = interactor.name else { return }
        
        switch name {
            
        case .welcome:
            self.trigger(.introActionView)
            
        case .intro:
            self.trigger(.deviceSetupCoordinator)
        
        default:
            break
        }
        
    }
    
    public func didCompleteSecondaryAction(_ interactor: ActionViewInteractor) {
        OSLog.info(domain: .interactor)
    }
    
}
