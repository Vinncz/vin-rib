import RIBs



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



/// Interface exposed by the given view controller, so this RIB may control it.
protocol ___VARIABLE_productName___ViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy. Since
    // this RIB does not own its own view, this protocol is conformed to by one of this
    // RIB's ancestor RIBs' view.
}



/// Manages a RIB that does not own its own view, but instead controls a view from one of its ancestor's.
final class ___VARIABLE_productName___Router: Router<___VARIABLE_productName___Interactable> {
    
    
    /// Reference to the view this RIB controls.
    private let controlledView: ___VARIABLE_productName___ViewControllable
    
    
    /// Initializes an instance of ``___VARIABLE_productName___Router``.
    /// 
    /// - Parameters:
    ///   - interactor: The Interactor of this RIB.
    ///   - viewController: The view controller that this RIB controls.
    init (
        interactor: ___VARIABLE_productName___Interactable, 
        viewController: ___VARIABLE_productName___ViewControllable
    ) {
        self.controlledView = viewController
        
        super.init(interactor: interactor)
        
        interactor.router = self
    }
    
    
    /// Customization point that is invoked after self becomes active.
    override func didLoad() {}
    
}



/// Conformance extension to the ``___VARIABLE_productName___Routing`` protocol.
/// Contains everything accessible or invokable by ``___VARIABLE_productName___Interactor``.
extension ___VARIABLE_productName___Router: ___VARIABLE_productName___Routing {
    
    
    /// Removes any `ViewControllable` this RIB may have added to the view hierarchy.
    func clearViewControllers() {
        // TODO: detach any child RIBs
        // TODO: nullify any references to child RIBs
    }
    
}
