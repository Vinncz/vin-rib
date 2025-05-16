import Foundation
import RIBs
import RxSwift
import SwiftUI
import UIKit



/// Contract adhered to by ``___VARIABLE_productName___Interactor``, listing the attributes and/or actions 
/// that ``___VARIABLE_productName___ViewController`` is allowed to access or invoke.
protocol ___VARIABLE_productName___PresentableListener: AnyObject {}



/// The visible region of `___VARIABLE_productName___RIB`.
final class ___VARIABLE_productName___NavigationController: UINavigationController {
    
    
    /// Reference to ``___VARIABLE_productName___Interactor``.
    weak var presentableListener: ___VARIABLE_productName___PresentableListener?
    
    
    /// Customization point that is invoked after self enters the view hierarchy.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: Select icons and rename the title.
        //                                                  ↓
        let tabBarItem: UITabBarItem = UITabBarItem(title: "___VARIABLE_productName___", 
                                                    image: UIImage(systemName: "rectangle"), 
                                                    selectedImage: UIImage(systemName: "rectangle.fill"))
        self.tabBarItem = tabBarItem
    }
    
}



/// Conformance to the ``___VARIABLE_productName___ViewControllable`` protocol.
/// Contains everything accessible or invokable by ``___VARIABLE_productName___Router``.
extension ___VARIABLE_productName___NavigationController: ___VARIABLE_productName___ViewControllable {
    
    
    /// Pushes the given `ViewControllable` onto the navigation stack.
    /// - Parameter viewControllable: The `ViewControllable` to be pushed.
    /// - Parameter animated: A Boolean value that indicates whether the transition should be animated.
    func push(_ viewControllable: ViewControllable, animated: Bool) {
        self.pushViewController(viewControllable.uiviewController, animated: animated)
    }
    
    
    /// Pops the top view controller off the navigation stack.
    /// - Parameter animated: A Boolean value that indicates whether the transition should be animated.
    /// - Returns: An optional view controller that was popped.
    @discardableResult func pop(animated: Bool) -> UIViewController? {
        self.popViewController(animated: animated)
    }
    
    
    /// Pops all view controllers on the navigation stack until the root view controller is at the top.
    /// - Parameter animated: A Boolean value that indicates whether the transition should be animated.
    /// - Note: This method does not remove the root view controller from the navigation stack.
    /// - Returns: An optional array of view controllers that were popped.
    @discardableResult func popToRoot(animated: Bool) -> [UIViewController]? {
        self.popToRootViewController(animated: animated)
    }
    
    
    /// Sets the view controllers of the navigation stack.
    /// - Parameter viewControllables: An array of `ViewControllable` to be set as the new view controllers.
    /// - Parameter animated: A Boolean value that indicates whether the transition should be animated.
    func set(_ viewControllables: [ViewControllable], animated: Bool) {
        let vcs = viewControllables.map { $0.uiviewController }
        self.setViewControllers(vcs, animated: animated)
    }
    
}



/// Conformance extension to the ``___VARIABLE_productName___Presentable`` protocol.
/// Contains everything accessible or invokable by ``___VARIABLE_productName___Interactor``.
extension ___VARIABLE_productName___NavigationController: ___VARIABLE_productName___Presentable {}
