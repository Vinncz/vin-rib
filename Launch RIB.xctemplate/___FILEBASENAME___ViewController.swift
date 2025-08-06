import Foundation
import RIBs
import RxSwift
import UIKit



/// Interface implemented by ``___VARIABLE_productName___Interactor`` to handle user interaction or lifecycle events from the view.
protocol ___VARIABLE_productName___PresentableListener: AnyObject {}
 
 

/// The special root-level view controller, where everything attaches to.
final class ___VARIABLE_productName___ViewController: UIViewController {
    
    
    /// Reference to ``___VARIABLE_productName___Interactor``.
    weak var presentableListener: ___VARIABLE_productName___PresentableListener?
    
    
    /// Reference to the overlaid `ViewControllable`.
    var overlaidViewControllable: (any ViewControllable)?
    
    
    /// Customization point that is invoked after self enters the view hierarchy.
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}



/// Conformance to the ``___VARIABLE_productName___ViewControllable`` protocol.
/// Contains methods that can be invoked by ``___VARIABLE_productName___Router``.
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
    
}



/// Conformance extension to the ``___VARIABLE_productName___Presentable`` protocol.
/// Contains methods that can be invoked by ``___VARIABLE_productName___Interactor``.
extension ___VARIABLE_productName___ViewController: ___VARIABLE_productName___Presentable {}
