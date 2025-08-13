import RIBs



/// The special top-level container, where RIBs dependency graph begins.
final class ___VARIABLE_productName___Component: Component<EmptyDependency> {}



/// Conformance to children's `Dependency` protocols.
extension ___VARIABLE_productName___Component {}



/// Type that can build a `___VARIABLE_productName___RIB` and wire its internal dependencies.
protocol ___VARIABLE_productName___Buildable: Buildable {
    
    
    /// Constructs the `___VARIABLE_productName___RIB`.
    func build() -> LaunchRouting
    
}



/// The composer of `___VARIABLE_productName___RIB`.
final class ___VARIABLE_productName___Builder: Builder<EmptyDependency>, ___VARIABLE_productName___Buildable {
    
    
    /// Initializes an instance of ``___VARIABLE_productName___Builder``.
    init() { super.init(dependency: EmptyComponent()) }
    
    
    /// Constructs the `___VARIABLE_productName___RIB`.
    func build() -> LaunchRouting {
        let component  = ___VARIABLE_productName___Component(dependency: dependency)
        let viewController = ___VARIABLE_productName___ViewController()
        let interactor = ___VARIABLE_productName___Interactor(component: component, presenter: viewController)
        
        return ___VARIABLE_productName___Router(
            interactor: interactor, 
            viewController: viewController
        )
    }
    
}
