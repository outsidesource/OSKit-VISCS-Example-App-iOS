//
//  ___VARIABLE_productName___Controller.swift
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import OSKit

public protocol I___VARIABLE_productName___Delegate: IViewDelegate {
    
}

public class ___VARIABLE_productName___Controller: VISCSViewController<___VARIABLE_productName___State> {
    
    public var ___VARIABLE_variableName___Delegate: I___VARIABLE_productName___Delegate? {
        didSet {
            viewDelegate = ___VARIABLE_variableName___Delegate
        }
    }
    
    override open func initStateStore() {

    }

    override open func initViewDelegate() {

    }
        
}
