import RIBs



/// A set of properties that are required by `___VARIABLE_productName___RIB` to function, 
/// supplied from the scope of its parent.
protocol ___VARIABLE_productName___Dependency: Dependency {}



/// Concrete implementation of the ``___VARIABLE_productName___Dependency`` protocol. 
/// Provides dependencies needed by all RIBs that will ever attach themselves to ``___VARIABLE_productName___Router``.
final class ___VARIABLE_productName___Component: Component<___VARIABLE_productName___Dependency> {}



/// Conformance to this RIB's children's `Dependency` protocols.
extension ___VARIABLE_productName___Component {}



/// Contract adhered to by ``___VARIABLE_productName___Builder``, listing necessary actions to
/// construct a functional `___VARIABLE_productName___RIB`.
protocol ___VARIABLE_productName___Buildable: Buildable {
    
    
    /// Constructs the `___VARIABLE_productName___RIB`.
    /// - Parameter listener: The `Interactor` of this RIB's parent.
    func build(withListener listener: ___VARIABLE_productName___Listener) -> ___VARIABLE_productName___Routing
    
}



/// The composer of `___VARIABLE_productName___RIB`.
final class ___VARIABLE_productName___Builder: Builder<___VARIABLE_productName___Dependency>, ___VARIABLE_productName___Buildable {
    
    
    /// Creates an instance of ``___VARIABLE_productName___Builder``.
    /// - Parameter dependency: Instance of other RIB's `Component` that conforms to this RIB's `Dependency` protocol.
    override init(dependency: ___VARIABLE_productName___Dependency) {
        super.init(dependency: dependency)
    }
    
    
    /// Constructs the `___VARIABLE_productName___RIB`.
    /// - Parameter listener: The `Interactor` of this RIB's parent.
    func build(withListener listener: ___VARIABLE_productName___Listener) -> ___VARIABLE_productName___Routing {
        let viewController = ___VARIABLE_productName___ViewController()
        let component = ___VARIABLE_productName___Component(dependency: dependency)
        let interactor = ___VARIABLE_productName___Interactor(component: component, presenter: viewController)
        
        interactor.listener = listener
        
        return ___VARIABLE_productName___Router(
            interactor: interactor, 
            viewController: viewController
        )
    }
    
}
