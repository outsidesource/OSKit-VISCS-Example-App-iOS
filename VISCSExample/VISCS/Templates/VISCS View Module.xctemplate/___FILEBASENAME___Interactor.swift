//
//  ___VARIABLE_productName___Interactor.swift
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import OSKit
import Resolver

public protocol I___VARIABLE_productName___Coordinator: AnyObject {
    
}

public class ___VARIABLE_productName___Interactor: Interactor<___VARIABLE_productName___State> {
    
    public weak var ___VARIABLE_variableName___Coordinator: I___VARIABLE_productName___Coordinator?

    public init(coordinator: I___VARIABLE_productName___Coordinator) {
        
        self.___VARIABLE_variableName___Coordinator = coordinator
        
        super.init(state: ___VARIABLE_productName___State())
        
    }
    
}

extension ___VARIABLE_productName___Interactor: I___VARIABLE_productName___Delegate {
    
}
