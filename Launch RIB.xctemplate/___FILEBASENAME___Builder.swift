import RIBs



/// An empty set of properties. As the ancestral RIB, 
/// `___VARIABLE_productName___RIB` does not require any dependencies from its parent scope.
protocol ___VARIABLE_productName___Dependency: Dependency {}
extension EmptyComponent: ___VARIABLE_productName___Dependency {}



/// Concrete implementation of the ``___VARIABLE_productName___Dependency`` protocol. 
/// Provides dependencies needed by all RIBs that will ever attach themselves to ``___VARIABLE_productName___Router``.
final class ___VARIABLE_productName___Component: Component<___VARIABLE_productName___Dependency> {
    
    
    /// Constructs a singleton instance of ``___VARIABLE_productName___ViewController``.
    // TODO: Convert to camelCase.
    //  ↓
    var ___VARIABLE_productName___ViewController: ___VARIABLE_productName___ViewControllable & ___VARIABLE_productName___Presentable {
        shared { ___VARIABLE_productName___ViewController() }
    }
    
}



/// Conformance extension to this RIB's children's `Dependency` protocols.
extension ___VARIABLE_productName___Component {}



/// Contract adhered to by ``___VARIABLE_productName___Builder``, listing necessary actions to
/// construct a functional `___VARIABLE_productName___RIB`.
protocol ___VARIABLE_productName___Buildable: Buildable {
    
    
    /// Constructs the `___VARIABLE_productName___RIB`.
    func build() -> LaunchRouting
    
}



/// The composer of `___VARIABLE_productName___RIB`.
final class ___VARIABLE_productName___Builder: Builder<___VARIABLE_productName___Dependency>, ___VARIABLE_productName___Buildable {
    
    
    /// Creates an instance of ``___VARIABLE_productName___Builder``.
    init() { super.init(dependency: EmptyComponent()) }
    
    
    /// Constructs the `___VARIABLE_productName___RIB`.
    func build() -> LaunchRouting {
        let component  = ___VARIABLE_productName___Component(dependency: dependency)
        let interactor = ___VARIABLE_productName___Interactor(component: component)
        
        return ___VARIABLE_productName___Router(
            interactor: interactor, 
            viewController: component.___VARIABLE_productName___ViewController
        )
    }
    
}
