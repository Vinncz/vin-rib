import RIBs
import UIKit



/// Contract adhered to by ``___VARIABLE_productName___Interactor``, listing the attributes and/or actions 
/// that ``___VARIABLE_productName___Router`` is allowed to access or invoke.
/// 
/// Conform this `Interactable` protocol with this RIB's children's `Listener` protocols.
protocol ___VARIABLE_productName___Interactable: Interactable {
    
    
    /// Reference to ``___VARIABLE_productName___Router``.
    var router: ___VARIABLE_productName___Routing? { get set }
    
    
    /// Reference to this RIB's parent's Interactor.
    var listener: ___VARIABLE_productName___Listener? { get set }
    
}



/// Contract adhered to by ``___VARIABLE_productName___ViewController``, listing the attributes and/or actions
/// that ``___VARIABLE_productName___Router`` is allowed to access or invoke.
protocol ___VARIABLE_productName___ViewControllable: ViewControllable {
    
    
    /// Pushes the given `ViewControllable` onto the navigation stack.
    /// - Parameter viewControllable: The `ViewControllable` to be pushed.
    /// - Parameter animated: A Boolean value that indicates whether the transition should be animated.
    func push(_ viewControllable: ViewControllable, animated: Bool)
    
    
    /// Pops the top view controller off the navigation stack.
    /// - Parameter animated: A Boolean value that indicates whether the transition should be animated.
    /// - Returns: An optional view controller that was popped.
    @discardableResult func pop(animated: Bool) -> UIViewController?
    
    
    /// Pops all view controllers on the navigation stack until the root view controller is at the top.
    /// - Parameter animated: A Boolean value that indicates whether the transition should be animated.
    /// - Note: This method does not remove the root view controller from the navigation stack.
    /// - Returns: An optional array of view controllers that were popped.
    @discardableResult func popToRoot(animated: Bool) -> [UIViewController]?
    
    
    /// Sets the view controllers of the navigation stack.
    /// - Parameter viewControllables: An array of `ViewControllable` to be set as the new view controllers.
    /// - Parameter animated: A Boolean value that indicates whether the transition should be animated.
    func set(_ viewControllables: [ViewControllable], animated: Bool)
    
}



/// The attachment point of `___VARIABLE_productName___RIB`.
final class ___VARIABLE_productName___Router: ViewableRouter<___VARIABLE_productName___Interactable, ___VARIABLE_productName___ViewControllable> {
    
    
    /// Constructs an instance of ``___VARIABLE_productName___Router``.
    /// - Parameter interactor: The interactor for this RIB.
    /// - Parameter viewController: The view controller for this RIB.
    override init(interactor: ___VARIABLE_productName___Interactable, viewController: ___VARIABLE_productName___ViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    
    /// Customization point that is invoked after self becomes active.
    override func didLoad() {}
    
}



/// Conformance extension to the ``___VARIABLE_productName___Routing`` protocol.
/// Contains everything accessible or invokable by ``___VARIABLE_productName___Interactor``.
extension ___VARIABLE_productName___Router: ___VARIABLE_productName___Routing {
    
    
    /// Cleanses the view hierarchy of any `ViewControllable` instances this RIB may have added.
    func cleanupViews() {
        viewController.set([], animated: false)
        // TODO: detach any child RIBs
        // TODO: nullify any references to child RIBs
    }
    
}
