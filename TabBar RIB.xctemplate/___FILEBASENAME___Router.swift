import RIBs
import UIKit



/// Interface exposed by ``___VARIABLE_productName___Interactor`` to coordinate routing and receive upstream events.
/// 
/// Conform this protocol to its children's `Listener` protocols,
/// to enable ``___VARIABLE_productName___Interactor`` to respond to its children's events.
protocol ___VARIABLE_productName___Interactable: Interactable {
    
    
    /// Reference to ``___VARIABLE_productName___Router``.
    var router: ___VARIABLE_productName___Routing? { get set }
    
    
    /// Reference to this RIB's parent's Interactor.
    var listener: ___VARIABLE_productName___Listener? { get set }
    
}



/// Interface exposed by ``___VARIABLE_productName___TabBarController`` to manipulate the tab stack.
protocol ___VARIABLE_productName___ViewControllable: ViewControllable {
    
    
    /// Sets the view controllers of the navigation stack.
    /// 
    /// - Parameters:
    ///   - tabs: An array of `ViewControllable` to be set as the new view controllers.
    ///   - animated: A Boolean value that indicates whether the transition should be animated.
    func set(tabs viewControllables: [ViewControllable], animated: Bool)
    
}



/// Manages a RIB whose view controller is a tab bar controller.
final class ___VARIABLE_productName___Router: ViewableRouter<___VARIABLE_productName___Interactable, ___VARIABLE_productName___ViewControllable> {
    
    
    /// Initializes an instance of ``___VARIABLE_productName___Router``.
    /// 
    /// - Parameters:
    ///   - interactor: The interactor for this RIB.
    ///   - viewController: The view controller for this RIB.
    override init (
        interactor: ___VARIABLE_productName___Interactable, 
        viewController: ___VARIABLE_productName___ViewControllable
    ) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    
    /// Customization point that is invoked after self becomes active.
    override func didLoad() {}
    
}



/// Conformance to the ``___VARIABLE_productName___Routing`` protocol.
/// Contains methods that can be invoked by ``___VARIABLE_productName___Interactor``.
extension ___VARIABLE_productName___Router: ___VARIABLE_productName___Routing {
    
    
    /// Removes any `ViewControllable` this RIB may have added to the view hierarchy.
    func clearViewControllers() {
        viewController.set(tabs: [], animated: false)
        // TODO: detach any child RIBs
        // TODO: nullify any references to child RIBs
    }
    
}
