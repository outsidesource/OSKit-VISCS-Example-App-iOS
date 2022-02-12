//
//  ActionViewController.swift
//  VISCSExample
//
//  Created by Brody Robertson
//  
//

import UIKit
import OSKit
import Resolver
import RxSwift
import RxSwiftExt

public protocol IActionViewDelegate: IViewDelegate {
    func didTapPrimaryButton(_ tag: Int?)
    func didTapSecondaryButton(_ tag: Int?)
}

/// ActionViewController class extension is used for convenient DI & storyboard resolution - storyboards cannot resolve generic types
public class ActionViewController: _ActionViewController<ActionViewState> { }
   
/// Base ActionViewController class allowing extension
open class _ActionViewController<StateType: IActionViewState>: VISCSViewController<StateType> {

    deinit {
        OSLog.debug(domains: logDomains)
    }
    
    let disposeBag = DisposeBag()
    
    // VISCSViewController subclasses should define their own delegates where applicable to compose new functionality
    public var actionViewDelegate: IActionViewDelegate? {
        didSet {
            // Set the super.viewDelegate to the composed viewDelegate
            viewDelegate = actionViewDelegate
        }
    }
    
    // Optional outlets allow implementing storyboards to omit elements
    @IBOutlet public weak var titleLabel: UILabel?
    @IBOutlet public weak var subtitleLabel: UILabel?
    @IBOutlet public weak var primaryButton: UIButton?
    @IBOutlet public weak var secondaryButton: UIButton?
    @IBOutlet public weak var activityIndicator: UIActivityIndicatorView?
    
    private let logDomains: [OSLog.Domain] = [.view, .actionView]
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        OSLog.info(domains: logDomains)
        
    }
    
    override open func initStateStore() {

        guard let stateStore = stateStore else {
            assertionFailure("nil stateStore")
            return
        }
        
        let stateObservable = stateStore.rx.state
        
        stateObservable
            .map { $0?.navigationItemState }
            .unwrapDistinctUntilChanged()
            .bind(to: navigationItem.rx.navigationItemState())
            .disposed(by: disposeBag)
        
        if let titleLabel = titleLabel {
            stateObservable
                .map { $0?.titleLabelState }
                .unwrapDistinctUntilChanged()
                .bind(to: titleLabel.rx.viewState())
                .disposed(by: disposeBag)
        }

        if let subtitleLabel = subtitleLabel {
            stateObservable
                .map { $0?.subtitleLabelState }
                .unwrapDistinctUntilChanged()
                .bind(to: subtitleLabel.rx.viewState())
                .disposed(by: disposeBag)
        }

        if let primaryButton = primaryButton {
            stateObservable
                .map { $0?.primaryButtonState }
                .unwrapDistinctUntilChanged()
                .bind(to: primaryButton.rx.viewState())
                .disposed(by: disposeBag)
        }
        
        if let secondaryButton = secondaryButton {
            stateObservable
                .map { $0?.secondaryButtonState }
                .unwrapDistinctUntilChanged()
                .bind(to: secondaryButton.rx.viewState())
                .disposed(by: disposeBag)
        }

        if let activityIndicator = activityIndicator {
            stateObservable
                .map { $0?.activityIndicatorState }
                .unwrapDistinctUntilChanged()
                .bind(to: activityIndicator.rx.viewState())
                .disposed(by: disposeBag)
        }

    }

    override open func initViewDelegate() {

        self.primaryButton?.rx.tap
            .do(onNext: { [weak self] sender in
                self?.actionViewDelegate?.didTapPrimaryButton(self?.primaryButton?.tag)
            })
            .subscribe()
            .disposed(by: disposeBag)

        self.secondaryButton?.rx.tap
            .do(onNext: { [weak self] _ in
                self?.actionViewDelegate?.didTapSecondaryButton(self?.secondaryButton?.tag)
            })
            .subscribe()
            .disposed(by: disposeBag)

    }
    
    
}
