//
//  ___VARIABLE_productName___Coordinator.swift
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import XCoordinator
import Resolver

public enum ___VARIABLE_productName___Route: Route {
    case initial
}

public class ___VARIABLE_productName___Coordinator: NavigationCoordinator<___VARIABLE_productName___Route> {
    
    override public func prepareTransition(for route: ___VARIABLE_productName___Route) -> NavigationTransition {

        switch route {
        case .initial:
            return .none()
        }

    }
    
}
