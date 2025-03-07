import RIBs


/// Collection of types whose instances are necessary for `___VARIABLE_productName___RIB` to function.
/// 
/// When you intend for `___VARIABLE_productName___RIB` to bear descendant(s), 
/// you **MUST** conform either ``___VARIABLE_productName___Dependency`` 
/// or ``___VARIABLE_productName___Component`` to their descendant(s)' `Dependency` protocol.
/// 
/// You'd only need to conform to your immidiate children's `Dependency` protocol--NOT the entire hierarchy.
/// 
/// When seen in context, this condition resembles trains that passes through stations--though they're not stopping there.
/// 
/// By default, ``___VARIABLE_productName___Builder`` uses a concrete implementation of
/// this protocol--usually the ``___VARIABLE_productName___Component``.
/// 
/// However, you can also make your custom class, then conform it to this protocol, and lastly pass it to the ``___VARIABLE_productName___Builder``. 
/// This would enable you to mock the dependencies for testing, or to provide a different implementation of the dependencies.
protocol ___VARIABLE_productName___Dependency: Dependency {}


/// Concrete implementation of ``___VARIABLE_productName___Dependency``.
/// 
/// An instance of `Component` is created by a `Builder`, to resolve instances for each attribute declared in its `Dependency`.
/// In this case, the ``___VARIABLE_productName___Builder`` is responsible to make an instance of ``___VARIABLE_productName___Component``
/// which then populates the properties of ``___VARIABLE_productName___Dependency``.
final class ___VARIABLE_productName___Component: Component<___VARIABLE_productName___Dependency> {
    // TODO: Convert to camelCase
    let ___VARIABLE_productName___ViewController: ___VARIABLE_productName___ViewController
    init (dependency: ___VARIABLE_productName___Dependency, viewController: ___VARIABLE_productName___ViewController) {
        self.___VARIABLE_productName___ViewController = viewController
        super.init(dependency: dependency)
    }
}


/// A ready-made `Component` that has no dependencies. 
/// 
/// Used by the ancestral RIB to initiate the RIB hierarchy.
final class ___VARIALE_productName___EmptyComponent: Component<EmptyDependency>, ___VARIABLE_productName___Dependency {
    init () { super.init(dependency: EmptyComponent()) }
}


/// Collection of methods who defines what it takes to construct `___VARIABLE_productName___RIB`.
///
/// By conforming a `Builder` to this, you declare that it can create and initialize 
/// the `___VARIABLE_productName___RIB` if given the required dependencies.
protocol ___VARIABLE_productName___Buildable: Buildable {
    func build () -> LaunchRouting
}


/// Constructs and assembles the `___VARIABLE_productName___RIB`. Created by the parent RIB--invoked by ``___VARIABLE_productName___Router``.
///
/// The `Builder` class are responsible for creating and assembling all the necessary parts of a RIB. 
/// This covers resolving dependencies to using them to instanciate `Interactor`, `Router`, and `ViewController`.
/// 
/// Whereas children may have their own children, a `Builder` is only responsible for its immediate descendants.
/// Meaning, its responsible for supplying its children with the builder that constructs grandchildren.
final class ___VARIABLE_productName___Builder: Builder<___VARIABLE_productName___Dependency>, ___VARIABLE_productName___Buildable {
    
    override init (dependency: ___VARIABLE_productName___Dependency) {
        super.init(dependency: dependency)
    }
    
    func build () -> LaunchRouting {
        let viewController = ___VARIABLE_productName___ViewController()
        let component = ___VARIABLE_productName___Component(dependency: dependency, viewController: viewController)
        let interactor = ___VARIABLE_productName___Interactor(presenter: viewController)
        
        return ___VARIABLE_productName___Router(interactor: interactor, viewController: viewController)
    }
    
}
