import RIBs
import RxSwift
import UIKit



/// Interface exposed by ``___VARIABLE_productName___Router`` to enable RIB tree manipulation.
protocol ___VARIABLE_productName___Routing: ViewableRouting {
        
    
    /// Removes any `ViewControllable` this RIB may have added to the view hierarchy.
    func clearViewControllers()
    
}



/// Interface exposed by ``___VARIABLE_productName___TabBarController`` to enable view manipulation.
protocol ___VARIABLE_productName___Presentable: Presentable {
    
    
    /// Reference to ``___VARIABLE_productName___Interactor``.
    var presentableListener: ___VARIABLE_productName___PresentableListener? { get set }
    
    
    /// Selects a tab in the tab bar controller.
    /// - Parameter viewController: The view controller to select.
    func select(viewController: UIViewController)
    
}



/// Interface exposed by the Interactor of `___VARIABLE_productName___RIB`'s parent. 
/// 
/// Listener protocols enables vertical communication between RIBs.
protocol ___VARIABLE_productName___Listener: AnyObject {}



/// Implements business logic and lifecycle coordination for `___VARIABLE_productName___RIB`.
///
/// Acts as the source of truth for state, handles user intent, and delegates navigation to the router.
final class ___VARIABLE_productName___Interactor: PresentableInteractor<___VARIABLE_productName___Presentable>, ___VARIABLE_productName___Interactable {
    
    
    /// Reference to ``___VARIABLE_productName___Router``.
    weak var router: ___VARIABLE_productName___Routing?
    
    
    /// Reference to this RIB's parent's Interactor.
    weak var listener: ___VARIABLE_productName___Listener?
    
    
    /// Reference to the component of this RIB.
    var component: ___VARIABLE_productName___Component
    
    
    /// Initializes an instance of ``___VARIABLE_productName___Interactor``.
    /// 
    /// - Parameters:
    ///   - component: The component of this RIB.
    ///   - presenter: The view controller that conforms to ``___VARIABLE_productName___Presentable``.
    init(component: ___VARIABLE_productName___Component, presenter: ___VARIABLE_productName___Presentable) {
        self.component = component
        
        super.init(presenter: presenter)
        
        presenter.presentableListener = self
    }
    
    
    /// Customization point that is invoked after self becomes active.
    override func didBecomeActive() {
        super.didBecomeActive()
    }
    
    
    /// Customization point that is invoked before self is fully detached.
    override func willResignActive() {
        super.willResignActive()
        router?.clearViewControllers()
    }
    
}



/// Conformance to the ``___VARIABLE_productName___PresentableListener`` protocol.
/// Contains methods that can be invoked by ``___VARIABLE_productName___ViewController``.
extension ___VARIABLE_productName___Interactor: ___VARIABLE_productName___PresentableListener {
    
    
    /// Informs the interactor to decide on whether a tab can be selected.
    /// 
    /// - Parameters:
    ///   - viewController: The view controller that is being selected.
    ///   - previouslySelected: The previously selected view controller, if any.
    /// - Returns: A Boolean indicating whether the tab should be selected.
    func shouldSelect(viewController: UIViewController, formerly previouslySelected: UIViewController?) -> Bool {
        true
    }
    
    
    /// Informs the interactor that a tab has been selected.
    /// 
    /// - Parameter viewController: The view controller that has been selected.
    func didSelect(viewController: UIViewController) {}
    
}
