import RIBs
import RxSwift


/// Collection of methods which ``___VARIABLE_productName___Interactor`` can invoke, 
/// to perform something on its enclosing router (``___VARIABLE_productName___Router``).
/// 
/// Conformance to this protocol is **EXCLUSIVE** to ``___VARIABLE_productName___Router`` (internal use).
/// 
/// The `Routing` protocol bridges between ``___VARIABLE_productName___Interactor`` and
/// ``___VARIABLE_productName___Router``, to enable business logic to manipulate the UI.
protocol ___VARIABLE_productName___Routing: ViewableRouting {}


/// Collection of methods which ``___VARIABLE_productName___Interactor`` can invoke, 
/// to present data on ``___VARIABLE_productName___ViewController``.
///
/// Conformance to this protocol is **EXCLUSIVE** to ``___VARIABLE_productName___ViewController``.
///
/// The `Presentable` protocol bridges between ``___VARIABLE_productName___Interactor`` and 
/// ``___VARIABLE_productName___ViewController``, to enable business logic to navigate the UI.
protocol ___VARIABLE_productName___Presentable: Presentable {
    var presentableListener: ___VARIABLE_productName___PresentableListener? { get set }
}


/// Collection of methods which ``___VARIABLE_productName___Interactor`` can invoke,
/// to perform logic on the parent's scope.
/// 
/// Conformance to this protocol is **EXCLUSIVE** to the parent's `Interactor` (external use).
/// 
/// The `Listener` protocol bridges between ``___VARIABLE_productName___Interactor`` and its parent's `Interactor`.
/// 
/// By conforming to this, the parent RIB declares that it is willing
/// to receive and handle events coming from ``___VARIABLE_productName___Interactor``.
protocol ___VARIABLE_productName___Listener: AnyObject {}


/// Handles business logic and coordinates with other RIBs.
/// 
/// The `Interactor` class are responsible for handling business logic, and bridging between the `Presenter` (view) and `Router`.
final class ___VARIABLE_productName___Interactor: PresentableInteractor<___VARIABLE_productName___Presentable>, ___VARIABLE_productName___Interactable, ___VARIABLE_productName___PresentableListener {
    
    
    /// The reference to the Router where self resides on.
    weak var router: ___VARIABLE_productName___Routing?
    
    
    /// The reference to parent's Interactor.
    /// 
    /// The word 'listener' is a convention used in RIBs, which refer to the preceding `Interactor` 
    /// who reacts to non-UI events from their descendants. (It 'listens' to them).
    weak var listener: ___VARIABLE_productName___Listener?
    
    
    // TODO: Add additional dependencies to constructor. Do not perform any logic in constructor.
    override init (presenter: ___VARIABLE_productName___Presentable) {
        super.init(presenter: presenter)
        presenter.presentableListener = self
    }
    
    
    /// Logics to perform after self becomes activated.
    override func didBecomeActive () {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }
    
    
    /// Logics to perform after self is nudged to be deactivated.
    override func willResignActive () {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
}


/// Extension to conform ``___VARIABLE_productName___Interactor`` with other RIBs' `Listener` protocols.
/// By conforming to them, you allow for ``___VARIABLE_productName___Interactor`` to react from events from their respective `Interactor`.
extension ___VARIABLE_productName___Interactor {}
