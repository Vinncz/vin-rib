import RIBs
import RxSwift
import UIKit



/// Contract adhered to by ``___VARIABLE_productName___Interactor``, listing the attributes and/or actions 
/// that ``___VARIABLE_productName___ViewController`` is allowed to access or invoke.
protocol ___VARIABLE_productName___PresentableListener: AnyObject {}
 
 

/// The visible region of `___VARIABLE_productName___RIB`.
final class ___VARIABLE_productName___ViewController: UIViewController, ___VARIABLE_productName___ViewControllable {
    
    
    /// Reference to ``___VARIABLE_productName___Interactor``.
    weak var presentableListener: ___VARIABLE_productName___PresentableListener?
    
    
    /// Customization point that is invoked after self enters the view hierarchy.
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}


/// Conformance extension to the ``___VARIABLE_productName___Presentable`` protocol.
/// Contains everything accessible or invokable by ``___VARIABLE_productName___Interactor``.
extension ___VARIABLE_productName___ViewController: ___VARIABLE_productName___Presentable {}
