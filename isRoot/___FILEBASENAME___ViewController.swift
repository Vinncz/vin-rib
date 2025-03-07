import RIBs
import RxSwift
import UIKit


/// Collection of methods which ``___VARIABLE_productName___ViewController`` can invoke, to perform business logic.
///
/// The `PresentableListener` protocol is responsible to bridge UI events to business logic.  
/// When an interaction with the UI is performed (e.g., pressed a button), ``___VARIABLE_productName___ViewController`` **MAY**
/// call method(s) declared here to notify the `Interactor` to perform any associated logics.
///
/// By default, ``___VARIABLE_productName___Interactor`` conforms to this protocol.
/// ``___VARIABLE_productName___ViewController``, in turn, can invoke methods declared in this protocol using its ``___VARIABLE_productName___ViewController/presentableListener`` attribute.
/// 
/// However, in case for RIB that does NOT have its own view, 
/// you **NEED** to conform this protocol to the bridging `Router` instead--and letting the `Router` to invoke the methods.
protocol ___VARIABLE_productName___PresentableListener: AnyObject {}


/// The UI of `___VARIABLE_productName___RIB`.
final class ___VARIABLE_productName___ViewController: UIViewController, ___VARIABLE_productName___Presentable, ___VARIABLE_productName___ViewControllable {
    weak var presentableListener: ___VARIABLE_productName___PresentableListener?
}


/// Extension to conform ``___VARIABLE_productName___ViewController`` with other RIBs' `ViewControllable` protocols.
/// By conforming to them, you allow for ``___VARIABLE_productName___ViewController`` to be manipulated by their respective `Router`.
extension ___VARIABLE_productName___ViewController {}
