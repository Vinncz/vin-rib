import RIBs



/// Contract adhered to by ``___VARIABLE_productName___Interactor``, listing the attributes and/or actions 
/// that ``___VARIABLE_productName___Router`` is allowed to access or invoke.
/// 
/// Conform this `Interactable` protocol with this RIB's children's `Listener` protocols.
protocol ___VARIABLE_productName___Interactable: Interactable {
    
    
    /// Reference to ``___VARIABLE_productName___Router``.
    var router: ___VARIABLE_productName___Routing? { get set }
    
    
    /// Reference to this RIB's parent's Interactor.
    var listener: ___VARIABLE_productName___Listener? { get set }
    
}



/// Contract adhered to by ``___VARIABLE_productName___ViewController``, listing the attributes and/or actions
/// that ``___VARIABLE_productName___Router`` is allowed to access or invoke.
protocol ___VARIABLE_productName___ViewControllable: ViewControllable {
    
    
    /// Attaches the given `ViewControllable` into the view hierarchy, becoming the top-most view controller.
    /// - Parameter newFlow: The `ViewControllable` to be attached.
    /// - Parameter completion: A closure to be executed after the operation is complete.
    /// 
    /// > Note: You are responsible for removing the previous `ViewControllable` from the view hierarchy.
    func attach(newFlow: ViewControllable, completion: (() -> Void)?)
    
    
    /// Clears the  `ViewControllable` from the view hierarchy.
    /// - Parameter completion: A closure to be executed after the cleanup is complete.
    func clear(completion: (() -> Void)?)
    
}



/// The attachment point of `___VARIABLE_productName___RIB`.
final class ___VARIABLE_productName___Router: LaunchRouter<___VARIABLE_productName___Interactable, ___VARIABLE_productName___ViewControllable> {
    
    
    /// Constructs an instance of ``___VARIABLE_productName___Router``.
    /// - Parameter interactor: The interactor for this RIB.
    /// - Parameter viewController: The view controller for this RIB.
    override init(interactor: ___VARIABLE_productName___Interactable, viewController: ___VARIABLE_productName___ViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    
    /// Customization point that is invoked after self becomes active.
    override func didLoad() {}
    
}



/// Conformance extension to the ``___VARIABLE_productName___Routing`` protocol.
/// Contains everything accessible or invokable by ``___VARIABLE_productName___Interactor``.
extension ___VARIABLE_productName___Router: ___VARIABLE_productName___Routing {
        
    
    /// Cleanses the view hierarchy of any `ViewControllable` instances this RIB may have added.
    func cleanupViews() {
        viewController.clear(completion: nil)
        // TODO: detach any child RIBs
        // TODO: nullify any references to child RIBs
    }
    
}
