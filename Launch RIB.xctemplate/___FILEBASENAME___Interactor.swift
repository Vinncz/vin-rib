import RIBs
import RxSwift



/// Interface exposed by ``___VARIABLE_productName___Router`` to enable RIB tree manipulation.
protocol ___VARIABLE_productName___Routing: ViewableRouting {
        
    
    /// Removes any `ViewControllable` this RIB may have added to the view hierarchy.
    func clearViewControllers()
    
}



/// Interface exposed by ``___VARIABLE_productName___ViewController`` to enable view manipulation.
protocol ___VARIABLE_productName___Presentable: Presentable {
    
    
    /// Reference to ``___VARIABLE_productName___Interactor``.
    var presentableListener: ___VARIABLE_productName___PresentableListener? { get set }
    
}



/// Implements business logic and lifecycle coordination for `___VARIABLE_productName___RIB`.
///
/// Acts as the source of truth for state, handles user intent, and delegates navigation to the router.
final class ___VARIABLE_productName___Interactor: PresentableInteractor<___VARIABLE_productName___Presentable>, ___VARIABLE_productName___Interactable {
    
    
    /// Reference to ``___VARIABLE_productName___Router``.
    weak var router: ___VARIABLE_productName___Routing?
    
    
    /// Reference to the component of this RIB.
    var component: ___VARIABLE_productName___Component
    
    
    /// Constructs an instance of ``___VARIABLE_productName___Interactor``.
    /// - Parameters: 
    ///   - component: The component of this RIB.
    ///   - presenter: The presenter for this RIB.
    init(component: ___VARIABLE_productName___Component, presenter: any ___VARIABLE_productName___Presentable) {
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
/// Contains everything accessible or invokable by ``___VARIABLE_productName___ViewController``.
extension ___VARIABLE_productName___Interactor: ___VARIABLE_productName___PresentableListener {}
