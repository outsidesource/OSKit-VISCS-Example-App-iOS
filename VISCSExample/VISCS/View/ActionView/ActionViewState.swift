//
//  ActionViewState.swift
//  VISCSExample
//
//  Created by Brody Robertson
//  
//

import OSKit

// If Interactor or ViewController extensibility is desired and we wish to use custom IViewState implementations we can define a state protocol in this fashion.
// associatedtype is typcially not required.
public protocol IActionViewState: IState {
    
    associatedtype NavigationItemStateType: INavigationItemState
    var navigationItemState: NavigationItemStateType { get }
    
    associatedtype TitleLabelStatType: ILabelState
    var titleLabelState: TitleLabelStatType { get }
    
    associatedtype SubtitleLabelStateType: ILabelState
    var subtitleLabelState: SubtitleLabelStateType { get }
    
    associatedtype PrimaryButtonStateType: IButtonState
    var primaryButtonState: PrimaryButtonStateType { get }
    
    associatedtype SecondaryButtonStateType: IButtonState
    var secondaryButtonState: SecondaryButtonStateType { get }
    
    associatedtype ActivityIndicatorStateType: IActivityIndicatorViewState
    var activityIndicatorState: ActivityIndicatorStateType { get }
    
}

public struct ActionViewState: IActionViewState {
    public var navigationItemState: NavigationItemState
    public var titleLabelState: LabelState
    public var subtitleLabelState: LabelState
    public var primaryButtonState: ButtonState
    public var secondaryButtonState: ButtonState
    public var activityIndicatorState: ActivityIndicatorViewState
}
