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



/// Defines navigation capabilities exposed to ``___VARIABLE_productName___Router``.
/// 
/// Use this protocol to work with ``___VARIABLE_productName___NavigationController``
/// and manipulate the navigation stack of a RIB.
protocol ___VARIABLE_productName___NavigationControllable: ViewControllable {
    
    
    /// Pushes the given view onto the navigation stack.
    /// - Parameters:
    ///   - viewControllable: The view to be pushed.
    ///   - animated: Whether the transition should be animated.
    func push(_ viewControllable: ViewControllable, animated: Bool)
    
    
    /// Pops the top view controller from the navigation stack.
    /// - Parameters:
    ///   - animated: Whether the transition should be animated.
    ///   - toRoot: If `true`, pops to the root view controller.
    /// - Returns: The popped view controller that triggers the pop action, or `nil` if none was found.
    @discardableResult func pop(animated: Bool, toRoot: Bool) -> UIViewController?
    
    
    /// Replaces the navigation stack with the given view controllers.
    /// - Parameters:
    ///   - viewControllables: The new stack of views.
    ///   - animated: Whether the transition should be animated.
    func set(viewControllables: [ViewControllable], animated: Bool)
    
}



/// Exposes UIKit-level view operations for use in SwiftUI-powered `___VARIABLE_productName___RIB`.
protocol ___VARIABLE_productName___ViewControllable: ViewControllable {
    
    
    /// Overlays the given `ViewControllable` onto the current view hierarchy.
    /// - Parameter viewControllable: The `ViewControllable` to be overlaid.
    func overlay(_ viewControllable: ViewControllable)
    
    
    /// Clears the overlaid `ViewControllable` from the view hierarchy.
    func clearOverlay()
    
    
    /// Presents the given `ViewControllable` modally.
    /// - Parameter viewControllable: The `ViewControllable` to be presented.
    func present(_ viewControllable: ViewControllable)
    
    
    /// Dismisses the currently presented `ViewControllable`.
    func dismiss()
    
    
    /// Removes the hosting controller (swiftui embed) from the view hierarchy and deallocates it.
    func nilHostingViewController()
    
}



/// Manages a RIB that owns both the root view controller and the navigation stack.
final class ___VARIABLE_productName___Router: ViewableRouter<___VARIABLE_productName___Interactable, ___VARIABLE_productName___NavigationControllable> {
    
    
    /// The navigation controller owned by this RIB.
    /// 
    /// Used by the router to manipulate views in a stack-based flow.
    var navigationController: ___VARIABLE_productName___NavigationControllable
    
    
    /// The view controller of this RIB's view hierarchy.
    /// 
    /// This view controller is presented or attached to the navigation stack as the initial screen.
    var rootViewController: ___VARIABLE_productName___ViewControllable
    
    
    /// Initializes an instance of ``___VARIABLE_productName___Router``.
    /// - Parameters:
    ///   - interactor: The interactor of this RIB.
    ///   - navigationController: The navigation controller managing this RIB's navigation stack.
    ///   - viewController: The initial screen of this RIB.
    init (
        interactor: ___VARIABLE_productName___Interactable, 
        navigationController: ___VARIABLE_productName___NavigationControllable, 
        viewController: ___VARIABLE_productName___ViewControllable
    ) {
        self.navigationController = navigationController
        self.rootViewController = viewController
        
        super.init(interactor: interactor, viewController: navigationController)
        
        interactor.router = self
    }
    
    
    /// Customization point that is invoked after self becomes active.
    override func didLoad() {}
    
}



/// Conformance extension to the ``___VARIABLE_productName___Routing`` protocol.
/// Contains methods that can be invoked by ``___VARIABLE_productName___Interactor``.
extension ___VARIABLE_productName___Router: ___VARIABLE_productName___Routing {
    
    
    /// Removes any `ViewControllable` this RIB may have added to the view hierarchy.
    func clearViewControllers() {
        rootViewController.dismiss()
        rootViewController.clearOverlay()
        navigationController.pop(animated: true, toRoot: true)
        navigationController.set(viewControllables: [], animated: false)
        // TODO: detach any child RIBs
        // TODO: nullify any references to child RIBs
    }
    
    
    /// Removes the hosting controller (swiftui embed) from the view hierarchy and deallocates it.
    func detachSwiftUI() {
        rootViewController.nilHostingViewController()
    }
    
}
