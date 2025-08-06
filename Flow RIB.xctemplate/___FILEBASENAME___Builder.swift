import RIBs



/// A "manifest of dependencies" required by `___VARIABLE_productName___RIB`, to be supplied from the scope of its parent.
/// 
/// Dependency protocols enable downward and facilitate sibling communications, namely through streams.
protocol ___VARIABLE_productName___Dependency: Dependency {}



/// Provider of dependencies for `___VARIABLE_productName___RIB` and its children.
final class ___VARIABLE_productName___Component: Component<___VARIABLE_productName___Dependency> {}



/// Conformance to children's `Dependency` protocols.
extension ___VARIABLE_productName___Component {}



/// A type that can build a `___VARIABLE_productName___RIB` and wire its internal dependencies.
protocol ___VARIABLE_productName___Buildable: Buildable {
    
    
    /// Constructs the `___VARIABLE_productName___RIB`.
    /// - Parameter listener: The `Interactor` of this RIB's parent.
    func build(withListener listener: ___VARIABLE_productName___Listener) -> ___VARIABLE_productName___Routing
    
}



/// The composer of `___VARIABLE_productName___RIB`.
final class ___VARIABLE_productName___Builder: Builder<___VARIABLE_productName___Dependency>, ___VARIABLE_productName___Buildable {
    
    
    /// Initializes an instance of ``___VARIABLE_productName___Builder``.
    /// - Parameter dependency: Other RIB's `Component` that conforms to ``___VARIABLE_productName___Dependency``.
    override init(dependency: ___VARIABLE_productName___Dependency) {
        super.init(dependency: dependency)
    }
    
    
    /// Constructs the `___VARIABLE_productName___RIB`.
    /// - Parameter listener: The `Interactor` of this RIB's parent.
    func build(withListener listener: ___VARIABLE_productName___Listener) -> ___VARIABLE_productName___Routing {
        let viewController = ___VARIABLE_productName___ViewController()
        let navigator = ___VARIABLE_productName___NavigationController()
            navigator.set(viewControllables: [viewController], animated: false)
        
        let component  = ___VARIABLE_productName___Component(dependency: dependency)
        let interactor = ___VARIABLE_productName___Interactor(component: component, presenter: viewController, navigator: navigator)
            interactor.listener = listener
        
        return ___VARIABLE_productName___Router(
            interactor: interactor, 
            navigationController: navigator,
            viewController: viewController
        )
    }
    
}
