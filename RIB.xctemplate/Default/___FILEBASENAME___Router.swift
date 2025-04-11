import RIBs



/// Contract adhered to by ``___VARIABLE_productName___Interactor``, listing the attributes and/or actions 
/// that ``___VARIABLE_productName___Router`` is allowed to access or invoke.
/// 
/// Conform this `Interactable` protocol with this RIB's children's `Listener` protocols.
protocol ___VARIABLE_productName___Interactable: Interactable {
    var router: ___VARIABLE_productName___Routing? { get set }
    var listener: ___VARIABLE_productName___Listener? { get set }
}



/// Contract adhered to by ``___VARIABLE_productName___ViewController``, listing the attributes and/or actions
/// that ``___VARIABLE_productName___Router`` is allowed to access or invoke.
protocol ___VARIABLE_productName___ViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy. Since
    // this RIB does not own its own view, this protocol is conformed to by one of this
    // RIB's ancestor RIBs' view.
}



/// The attachment point of `___VARIABLE_productName___RIB`.
final class ___VARIABLE_productName___Router: Router<___VARIABLE_productName___Interactable> {
    
    
    /// Reference to the view this RIB manages.
    private let controlledView: ___VARIABLE_productName___ViewControllable
    
    
    /// Constructs an instance of ``___VARIABLE_productName___Router``.
    /// - Parameter interactor: The interactor for this RIB.
    /// - Parameter viewController: The view controller for this RIB.
    init(interactor: ___VARIABLE_productName___Interactable, viewController: ___VARIABLE_productName___ViewControllable) {
        self.controlledView = viewController
        super.init(interactor: interactor)
        interactor.router = self
    }
    
    
    /// Customization point that is invoked before self is detached.
    /// Used to remove any views this RIB may have added to the view hierarchy.
    func cleanupViews() {}
    
}



/// Conformance extension to the ``___VARIABLE_productName___Routing`` protocol.
/// Contains everything accessible or invokable by ``___VARIABLE_productName___Interactor``
extension ___VARIABLE_productName___Router: ___VARIABLE_productName___Routing {}
