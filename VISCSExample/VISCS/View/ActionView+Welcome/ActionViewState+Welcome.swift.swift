//
//  ActionViewState+Welcome.swift.swift
//  VISCSExample
//
//  Created by Brody Robertson
//  Copyright © 2022 Outside Source. All rights reserved.
//

import OSKit

extension ActionViewState {
    
    static var welcome: ActionViewState {
        let navigationItemState = NavigationItemState(backButtonTitle: " ")
        let titleLabelState = LabelState(text: "VISCS Example")
        let subtitleLabelState = LabelState(text: "Welcome to the VISCS example app.\n\nThis app demonstrates the basics of the VISCS architecture.")
        let primaryButtonState = ButtonState(title: "Get Started")
        let secondaryButtonState = ButtonState(isEnabled: false, title: " ")
        //let secondaryButtonState = ButtonState(isHidden: true)
        return .init(navigationItemState: navigationItemState, titleLabelState: titleLabelState, subtitleLabelState: subtitleLabelState, primaryButtonState: primaryButtonState, secondaryButtonState: secondaryButtonState, activityIndicatorState: ActivityIndicatorViewState(isAnimating: false))
    }
                                            
}
