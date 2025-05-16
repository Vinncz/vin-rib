import RIBs
import RxSwift



/// Contract adhered to by ``___VARIABLE_productName___Router``, listing the attributes and/or actions 
/// that ``___VARIABLE_productName___Interactor`` is allowed to access or invoke.
protocol ___VARIABLE_productName___Routing: ViewableRouting {
        
    
    /// Cleanses the view hierarchy of any `ViewControllable` instances this RIB may have added.
    func cleanupViews()
    
}



/// Contract adhered to by ``___VARIABLE_productName___ViewController``, listing the attributes and/or actions
/// that ``___VARIABLE_productName___Interactor`` is allowed to access or invoke.
protocol ___VARIABLE_productName___Presentable: Presentable {
    
    
    /// Reference to ``___VARIABLE_productName___Interactor``.
    var presentableListener: ___VARIABLE_productName___PresentableListener? { get set }
    
}



/// Contract adhered to by the Interactor of `___VARIABLE_productName___RIB`'s parent, listing the attributes and/or actions
/// that ``___VARIABLE_productName___Interactor`` is allowed to access or invoke.
protocol ___VARIABLE_productName___Listener: AnyObject {}



/// The functionality centre of `___VARIABLE_productName___RIB`, where flow, communication, and coordination
/// are determined and initiated from.
final class ___VARIABLE_productName___Interactor: PresentableInteractor<___VARIABLE_productName___Presentable>, ___VARIABLE_productName___Interactable {
    
    
    /// Reference to ``___VARIABLE_productName___Router``.
    weak var router: ___VARIABLE_productName___Routing?
    
    
    /// Reference to this RIB's parent's Interactor.
    weak var listener: ___VARIABLE_productName___Listener?
    
    
    /// Reference to the component of this RIB.
    var component: ___VARIABLE_productName___Component
    
    
    /// Constructs an instance of ``___VARIABLE_productName___Interactor``.
    /// - Parameter component: The component of this RIB.
    init(component: ___VARIABLE_productName___Component) {
        self.component = component
        // TODO: Convert to camelCase.
        //                        ↓
        let presenter = component.___VARIABLE_productName___ViewController
        
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
        router?.cleanupViews()
    }
    
}



/// Conformance to the ``___VARIABLE_productName___PresentableListener`` protocol.
/// Contains everything accessible or invokable by ``___VARIABLE_productName___ViewController``.
extension ___VARIABLE_productName___Interactor: ___VARIABLE_productName___PresentableListener {}
