//
//  IntroActionView.swift
//  VISCSExample
//
//  Created by Brody Robertson
//  Copyright © 2022 Outside Source. All rights reserved.
//

import OSKit

extension ActionViewState {
    
    static var intro: ActionViewState {
        let navigationItemState = NavigationItemState(title: "VISCS Introduction", backButtonTitle: " ")
        let titleLabelState = LabelState(isHidden: true)
        let subtitleLabelState = LabelState(text: "The VISCS (VISCS) architecture is an opinionated architecture & system for developing Apps, SDKs, or Any type of software.")
        let primaryButtonState = ButtonState(title: "Setup Device")
        let secondaryButtonState = ButtonState(isEnabled: false, title: " ")
        //let secondaryButtonState = ButtonState(isHidden: true)
        return .init(navigationItemState: navigationItemState, titleLabelState: titleLabelState, subtitleLabelState: subtitleLabelState, primaryButtonState: primaryButtonState, secondaryButtonState: secondaryButtonState, activityIndicatorState: ActivityIndicatorViewState(isAnimating: false))
    }
                                            
}
