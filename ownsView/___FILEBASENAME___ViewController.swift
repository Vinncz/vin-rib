import RIBs
import RxSwift
import UIKit


/// Collection of methods which ``___VARIABLE_productName___ViewController`` can invoke, to perform business logic.
///
/// The `PresentableListener` protocol is responsible to bridge UI events to business logic.  
/// When an interaction with the UI is performed (e.g., pressed a button), ``___VARIABLE_productName___ViewController`` **MAY**
/// call method(s) declared here to notify the `Interactor` to perform any associated logics.
///
/// Conformance of this protocol is **EXCLUSIVE** to ``___VARIABLE_productName___Interactor`` (internal use).
/// ``___VARIABLE_productName___ViewController``, in turn, can invoke methods declared in this protocol 
/// via its ``___VARIABLE_productName___ViewController/presentableListener`` attribute.
protocol ___VARIABLE_productName___PresentableListener: AnyObject {}


/// The UI of `___VARIABLE_productName___RIB`.
final class ___VARIABLE_productName___ViewController: UIViewController, ___VARIABLE_productName___Presentable, ___VARIABLE_productName___ViewControllable {
    
    
    /// The reference to ``___VARIABLE_productName___Interactor``.
    /// 
    /// The word 'presentableListener' is a convention used in RIBs, which refer to the `Interactor`
    /// who reacts to UI events from their descendants. (It 'listens' to them).
    weak var presentableListener: ___VARIABLE_productName___PresentableListener?
    
}


/// Extension to conform ``___VARIABLE_productName___ViewController`` with other RIBs' `ViewControllable` protocols.
/// By conforming to them, you allow for ``___VARIABLE_productName___ViewController`` to be manipulated by their respective `Router`.
extension ___VARIABLE_productName___ViewController {}
