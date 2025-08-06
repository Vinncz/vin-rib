import Foundation
import RIBs
import RxSwift
import UIKit



/// Interface implemented by ``___VARIABLE_productName___Interactor`` to handle user interaction events from the view.
protocol ___VARIABLE_productName___NavigableListener: AnyObject {
        
    
    /// Informs ``___VARIABLE_productName___Router`` that the navigation controller has exited the view hierarchy; 
    /// commonly due to being popped off a navigation stack or dismissed.
    func didExitViewHierarchy()
    
}



/// A `UINavigationController` subclass that manages the navigation stack for `RecentsRIB`.
final class ___VARIABLE_productName___NavigationController: UINavigationController {
    
    
    /// Reference to ``___VARIABLE_productName___Interactor``.
    weak var navigableListener: ___VARIABLE_productName___NavigableListener?
    
    
    /// Customization point that is invoked after self enters the view hierarchy.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Customization for cases where self is a children of a `UITabBarController`.
        // TODO: Select icons and rename the title.
        //                                                  ↓
        let tabBarItem: UITabBarItem = UITabBarItem(title: "___VARIABLE_productName___", 
                                                    image: UIImage(systemName: "rectangle"), 
                                                    selectedImage: UIImage(systemName: "rectangle.fill"))
        self.tabBarItem = tabBarItem
    }
    
    
    /// Customization point that is invoked after self has fully been dismissed, 
    /// covered, or otherwise hidden, when any transition animations have completed.
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if isMovingFromParent || isBeingDismissed {
            navigableListener?.didExitViewHierarchy()
        }
    }
    
}



/// Conformance to the ``___VARIABLE_productName___ViewControllable`` protocol.
/// Contains everything accessible or invokable by ``___VARIABLE_productName___Router``.
extension ___VARIABLE_productName___NavigationController: ___VARIABLE_productName___NavigationControllable {
    
    
    /// Pushes the given view onto the navigation stack.
    /// - Parameters:
    ///   - viewControllable: The view to be pushed.
    ///   - animated: Whether the transition should be animated.
    func push(_ viewControllable: ViewControllable, animated: Bool = true) {
        self.pushViewController(viewControllable.uiviewController, animated: animated)
    }
    
    
    /// Pops the top view controller from the navigation stack.
    /// - Parameters:
    ///   - animated: Whether the transition should be animated.
    ///   - toRoot: If `true`, pops to the root view controller.
    /// - Returns: The popped view controller that triggers the pop action, or `nil` if none was found.
    @discardableResult func pop(animated: Bool = true, toRoot: Bool = false) -> UIViewController? {
        if toRoot {
            return self.popToRootViewController(animated: animated)?.last
        }
        
        return self.popViewController(animated: animated)
    }
    
    
    /// Replaces the navigation stack with the given view controllers.
    /// - Parameters:
    ///   - viewControllables: The new stack of views.
    ///   - animated: Whether the transition should be animated.
    func set(viewControllables: [ViewControllable], animated: Bool = true) {
        let vcs = viewControllables.map { $0.uiviewController }
        self.setViewControllers(vcs, animated: animated)
    }
    
}



/// Conformance to the ``___VARIABLE_productName___Navigable`` protocol.
/// Contains everything accessible or invokable by ``___VARIABLE_productName___Interactor``.
extension ___VARIABLE_productName___NavigationController: ___VARIABLE_productName___Navigable {}
