import RIBs
import RxSwift



/// Interface exposed by ``___VARIABLE_productName___Router`` to enable RIB tree manipulation.
protocol ___VARIABLE_productName___Routing: Routing {
        
    
    /// Removes any `ViewControllable` this RIB may have added to the view hierarchy.
    func clearViewControllers()
    
}



/// Interface exposed by the Interactor of `___VARIABLE_productName___RIB`'s parent. 
/// 
/// Listener protocols enables vertical communication between RIBs.
protocol ___VARIABLE_productName___Listener: AnyObject {}



/// Implements business logic and lifecycle coordination for `___VARIABLE_productName___RIB`.
///
/// Acts as the source of truth for state, handles user intent, and delegates navigation to the router.
final class ___VARIABLE_productName___Interactor: Interactor, ___VARIABLE_productName___Interactable {
    
    
    /// Reference to ``___VARIABLE_productName___Router``.
    weak var router: ___VARIABLE_productName___Routing?
    
    
    /// Reference to this RIB's parent's Interactor.
    weak var listener: ___VARIABLE_productName___Listener?
    
    
    /// Reference to the component of this RIB.
    var component: ___VARIABLE_productName___Component
    
    
    /// Initializes an instance of ``___VARIABLE_productName___Interactor``.
    /// - Parameter component: The component of this RIB.
    init(component: ___VARIABLE_productName___Component) {
        self.component = component
    }
    
    
    /// Customization point that is invoked after self becomes active.
    override func didBecomeActive() {
        super.didBecomeActive()
    }
    
    
    /// Customization point that is invoked before self is detached.
    override func willResignActive() {
        super.willResignActive()
        router?.clearViewControllers()
    }
    
}
