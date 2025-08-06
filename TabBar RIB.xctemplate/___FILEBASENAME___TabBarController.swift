import Foundation
import RIBs
import RxSwift
import SwiftUI
import UIKit



/// Interface implemented by ``___VARIABLE_productName___Interactor`` to handle user interaction events from the view.
protocol ___VARIABLE_productName___PresentableListener: AnyObject {
    
    
    /// Informs the interactor to decide on whether a tab can be selected.
    /// 
    /// - Parameters:
    ///   - viewController: The view controller that is being selected.
    ///   - previouslySelected: The previously selected view controller, if any.
    /// - Returns: A Boolean indicating whether the tab should be selected.
    func shouldSelect(viewController: UIViewController, formerly previouslySelected: UIViewController?) -> Bool
    
    
    /// Informs the interactor that a tab has been selected.
    /// 
    /// - Parameter viewController: The view controller that has been selected.
    func didSelect(viewController: UIViewController)
    
}



/// The visible region of `___VARIABLE_productName___RIB`.
final class ___VARIABLE_productName___TabBarController: UITabBarController {
    
    
    /// Reference to ``___VARIABLE_productName___Interactor``.
    weak var presentableListener: ___VARIABLE_productName___PresentableListener?
    
    
    /// Customization point that is invoked after self enters the view hierarchy.
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}



/// Conformance to the ``___VARIABLE_productName___ViewControllable`` protocol.
/// Contains everything accessible or invokable by ``___VARIABLE_productName___Router``.
extension ___VARIABLE_productName___TabBarController: ___VARIABLE_productName___ViewControllable {
    
    
    /// Sets the view controllers of the navigation stack.
    /// - Parameters:
    ///   - viewControllables: An array of `ViewControllable` to be set as the new view controllers.
    ///   - animated: A Boolean value that indicates whether the transition should be animated.
    func set(tabs viewControllables: [ViewControllable], animated: Bool) {
        let vcs = viewControllables.map { $0.uiviewController }
        self.setViewControllers(vcs, animated: animated)
    }
    
}



/// Conformance extension to the ``___VARIABLE_productName___Presentable`` protocol.
/// Contains everything accessible or invokable by ``___VARIABLE_productName___Interactor``.
extension ___VARIABLE_productName___TabBarController: ___VARIABLE_productName___Presentable {
    
    
    /// Selects a tab in the tab bar controller.
    /// - Parameter viewController: The view controller to select.
    func select(viewController: UIViewController) {
        self.selectedViewController = viewController
    }
    
}



/// Conformance to `UITabBarControllerDelegate` to handle tab bar interactions.
extension ___VARIABLE_productName___TabBarController: UITabBarControllerDelegate {
    
    
    /// Informs presentable listener to decide on whether a tab can be selected.
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect newViewController: UIViewController) -> Bool {
        return presentableListener?.shouldSelect(viewController: newViewController, formerly: tabBarController.selectedViewController) ?? true
    }
    
    
    /// Informs presentable listener after a tab has been selected.
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // Handle tab selection if needed.
        // For example, you can notify the interactor or perform some action.
        presentableListener?.didSelect(viewController: viewController)
    }
    
}
