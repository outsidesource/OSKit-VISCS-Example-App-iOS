//
//  ActionViewInteractor.swift
//  VISCSExample
//
//  Created by Brody Robertson
//  
//

import OSKit

public protocol IActionViewCoordinator: AnyObject {
    func didCompletePrimaryAction(_ interactor: ActionViewInteractor)
    func didCompleteSecondaryAction(_ interactor: ActionViewInteractor)
}

public class ActionViewInteractor: Interactor<ActionViewState> {
    
    deinit {
        OSLog.debug(domains: logDomains)
    }
    
    public struct Name: ExpressibleByStringLiteral, Equatable {
        public let rawValue: String
        public init(stringLiteral: String) {
            self.rawValue = stringLiteral
        }
    }
    
    /// The name used to naively disambiguate the Interactor by a Coordinator
    public let name: Name?
    
    /// The coordination delegate
    public weak var actionViewCoordinator: IActionViewCoordinator?
    
    private let logDomains: [OSLog.Domain] = [.interactor, .actionView]
    
    public init(state: StateType? = nil, name: Name? = nil, coordinator: IActionViewCoordinator? = nil) {
        OSLog.info(domains: logDomains)
        
        self.name = name
        self.actionViewCoordinator = coordinator
        
        super.init(state: state)   
    }
    
}

extension ActionViewInteractor: IActionViewDelegate {
    
    open func didTapPrimaryButton(_ tag: Int? = nil) {
        OSLog.info(domains: logDomains)
        
        actionViewCoordinator?.didCompletePrimaryAction(self)
    }
    
    open func didTapSecondaryButton(_ tag: Int? = nil) {
        OSLog.info(domains: logDomains)
        
        actionViewCoordinator?.didCompleteSecondaryAction(self)
    }
    
}
