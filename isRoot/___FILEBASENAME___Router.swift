import RIBs


/// Collection of references that anyone would need to conform to, 
/// in order to communicate with ``___VARIABLE_productName___Interactor``.
protocol ___VARIABLE_productName___Interactable: Interactable {
    var router  : ___VARIABLE_productName___Routing? { get set }
    var listener: ___VARIABLE_productName___Listener? { get set }
}


/// Collection of methods which ``___VARIABLE_productName___Router`` can invoke,
/// to manipulate `ViewController`(s) that conforms to this.
/// 
/// By conforming a `ViewController`, you allow for them 
/// to be manipulated by ``___VARIABLE_productName___Router``.
/// 
/// By conforming a `Router` to this, you declare that said `Router` will bridge out
/// any interactions from ``___VARIABLE_productName___Router`` to manipulate the conforming `ViewController`.
protocol ___VARIABLE_productName___ViewControllable: ViewControllable {}


/// Manages the structure of `___VARIABLE_productName___RIB`--and by extension, its children.
final class ___VARIABLE_productName___Router: LaunchRouter<___VARIABLE_productName___Interactable, ___VARIABLE_productName___ViewControllable>, ___VARIABLE_productName___Routing {
    
    // TODO: Add builders of children
    // private let childBuilder: ___VARIABLE_productName___Buildable
    
    // TODO: Constructor inject child builder protocols to allow building children.
    override init (interactor: ___VARIABLE_productName___Interactable, viewController: ___VARIABLE_productName___ViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
}
