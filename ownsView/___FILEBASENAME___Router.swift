import RIBs


/// The `Interactable` protocol declares that all `Interactor` classes
/// can communicate with its enclosing `Router` and its parent's `Interactor`.
/// 
/// Conformance to this protocol is **EXCLUSIVE** to 
/// ``___VARIABLE_productName___Interactor`` (internal use).
protocol ___VARIABLE_productName___Interactable: Interactable {
    var router  : ___VARIABLE_productName___Routing? { get set }
    var listener: ___VARIABLE_productName___Listener? { get set }
}


/// Collection of methods which allow for view manipulation without exposing UIKit.
/// 
/// This protocol may be used externally of `___VARIABLE_productName___RIB`.
/// 
/// By conforming some `ViewController` to this, you allow for them 
/// to be manipulated by ``___VARIABLE_productName___Router``.
/// 
/// By conforming this RIB's descendant's `Router` to this, 
/// you declare that said `Router` will bridge out ny interactions 
/// coming from ``___VARIABLE_productName___Router`` that manipulates 
/// the view its controlling.
protocol ___VARIABLE_productName___ViewControllable: ViewControllable {}


/// Manages the UI of `___VARIABLE_productName___RIB` and relation with another RIB.
final class ___VARIABLE_productName___Router: ViewableRouter<___VARIABLE_productName___Interactable, ___VARIABLE_productName___ViewControllable>, ___VARIABLE_productName___Routing {
    
    // TODO: Add builders of children
    // private let childBuilder: /*ChildRIBName*/Buildable
    
    // TODO: Add references to children's ViewControllable so this router can manipulate them.
    // private var currentChild: 
    
    // TODO: Constructor inject child builder protocols to allow building children.
    override init (
        interactor    : ___VARIABLE_productName___Interactable, 
        viewController: ___VARIABLE_productName___ViewControllable
        // TODO: Constructor inject child builder protocols.
        // childBuilder: /*ChildRIBName*/Buildable
    ) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
}
