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



/// Interface exposed by ``___VARIABLE_productName___ViewController`` to manipulate the view hierarchy.
protocol ___VARIABLE_productName___ViewControllable: ViewControllable {
    
    
    /// Overlays the given `ViewControllable` onto the current view hierarchy.
    /// - Parameter viewControllable: The `ViewControllable` to be overlaid.
    func overlay(_ viewControllable: ViewControllable)
    
    
    /// Clears the overlaid `ViewControllable` from the view hierarchy.
    func clearOverlay()
    
    
    /// Presents the given `ViewControllable` modally.
    /// - Parameter viewControllable: The `ViewControllable` to be presented.
    func present(_ viewControllable: ViewControllable)
    
    
    /// Dismisses the currently presented `ViewControllable`.
    func dismiss()
    
}



/// Manages a RIB that owns a view controller.
final class ___VARIABLE_productName___Router: ViewableRouter<___VARIABLE_productName___Interactable, ___VARIABLE_productName___ViewControllable> {
    
    
    /// Initializes an instance of ``___VARIABLE_productName___Router``.
    /// - Parameters:
    ///   - interactor: The interactor for this RIB.
    ///   - viewController: The view controller for this RIB.
    override init (
        interactor: ___VARIABLE_productName___Interactable, 
        viewController: ___VARIABLE_productName___ViewControllable
    ) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    
    /// Customization point that is invoked after self becomes active.
    override func didLoad() {}
    
}



/// Conformance extension to the ``___VARIABLE_productName___Routing`` protocol.
/// Contains methods that can be invoked by ``___VARIABLE_productName___Interactor``.
extension ___VARIABLE_productName___Router: ___VARIABLE_productName___Routing {
    
    
    /// Removes the view hierarchy from any `ViewControllable` instances this RIB may have added.
    func clearViewControllers() {
        viewController.dismiss()
        viewController.clearOverlay()
        // TODO: detach any child RIBs
        // TODO: nullify any references to child RIBs
    }
    
}
