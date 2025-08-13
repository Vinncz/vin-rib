import Foundation
import RIBs
import RxSwift
import SwiftUI
import UIKit



/// Interface implemented by ``___VARIABLE_productName___Interactor`` to handle user interaction or lifecycle events from the view.
protocol ___VARIABLE_productName___PresentableListener: AnyObject {
    
    
    /// Informs ``___VARIABLE_productName___Router`` that the navigation controller has exited the view hierarchy; 
    /// commonly due to being popped off a navigation stack or dismissed.
    func didExitViewHierarchy()
    
}
 
 

/// The visible region of `___VARIABLE_productName___RIB`.
final class ___VARIABLE_productName___ViewController: UIViewController {
    
    
    /// Reference to ``___VARIABLE_productName___Interactor``.
    weak var presentableListener: ___VARIABLE_productName___PresentableListener?
    
    
    /// Reference to ``___VARIABLE_productName___ViewModel``.
    weak var viewModel: ___VARIABLE_productName___ViewModel?
    
    
    /// The SwiftUI view that is displayed by this view controller.
    var hostingController: UIHostingController<___VARIABLE_productName___SwiftUIView>?
    
    
    /// Reference to the overlaid `ViewControllable`.
    var overlaidViewControllable: (any ViewControllable)?
    
    
    /// Customization point that is invoked after self enters the view hierarchy.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard hostingController != nil else {
            buildHostingController()
            return
        }
    }
    
    
    /// Customization point that is invoked after self has fully been dismissed, 
    /// covered, or otherwise hidden, when any transition animations have completed.
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if isMovingFromParent || isBeingDismissed {
            presentableListener?.didExitViewHierarchy()
        }
    }
    
    
    /// Constructs an instance of ``___VARIABLE_productName___SwiftUIView``, wraps them into `UIHostingController`,
    /// and sets it as the root view of this view controller.
    func buildHostingController() {
        guard let viewModel else { fatalError("ViewModel is missing. Have you called `attachChild(_)` on self's parent's router?") }
        
        let swiftUIView = ___VARIABLE_productName___SwiftUIView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: swiftUIView)
        
        self.addChild(hostingController)
        self.view.addSubview(hostingController.view)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        hostingController.didMove(toParent: self)
        self.hostingController = hostingController
    }
    
}



/// Conformance to the ``___VARIABLE_productName___ViewControllable`` protocol.
/// Contains everything accessible or invokable by ``___VARIABLE_productName___Router``.
extension ___VARIABLE_productName___ViewController: ___VARIABLE_productName___ViewControllable {
    
    
    /// Overlays the given `ViewControllable` onto the current view hierarchy.
    /// - Parameter viewControllable: The `ViewControllable` to be overlaid.
    func overlay(_ viewControllable: ViewControllable) {
        let viewController = viewControllable.uiviewController
        self.addChild(viewController)
        self.view.addSubview(viewController.view)
        
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            viewController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            viewController.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            viewController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        viewController.didMove(toParent: self)
        self.overlaidViewControllable = viewControllable
    }
    
    
    /// Clears the overlaid `ViewControllable` from the view hierarchy.
    func clearOverlay() {
        self.overlaidViewControllable?.uiviewController.willMove(toParent: nil)
        self.overlaidViewControllable?.uiviewController.view.removeFromSuperview()
        self.overlaidViewControllable?.uiviewController.removeFromParent()
        self.overlaidViewControllable = nil
    }
    
    
    /// Presents the given `ViewControllable` modally.
    /// - Parameter viewControllable: The `ViewControllable` to be presented.
    func present(_ viewControllable: ViewControllable) {
        let viewController = viewControllable.uiviewController
        self.present(viewController, animated: true, completion: nil)
        self.overlaidViewControllable = viewControllable
    }
    
    
    /// Dismisses the currently presented `ViewControllable`.
    func dismiss() {
        self.overlaidViewControllable?.uiviewController.dismiss(animated: true, completion: nil)
        self.overlaidViewControllable = nil
    }
    
    
    /// Removes the hosting controller from the view hierarchy and deallocates it.
    func nilHostingViewController() {
        if let hostingController {
            hostingController.view.removeFromSuperview()
            hostingController.removeFromParent()
            hostingController.didMove(toParent: nil)
        }
        
        self.hostingController = nil
    }
    
}



/// Conformance extension to the ``___VARIABLE_productName___Presentable`` protocol.
/// Contains methods that can be invoked by ``___VARIABLE_productName___Interactor``.
extension ___VARIABLE_productName___ViewController: ___VARIABLE_productName___Presentable {
    
    
    /// Binds the view model to the view.
    /// - Parameter viewModel: The `@Observable`-conformed view model.
    func bind(viewModel: ___VARIABLE_productName___ViewModel) {
        self.viewModel = viewModel
    }
    
    
    /// Unbinds the view model from the view controller.
    func unbindViewModel() {
        self.viewModel = nil
    }
    
}
