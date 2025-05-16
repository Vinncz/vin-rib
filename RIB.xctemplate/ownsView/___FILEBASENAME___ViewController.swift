import Foundation
import RIBs
import RxSwift
import UIKit



/// Contract adhered to by ``___VARIABLE_productName___Interactor``, listing the attributes and/or actions 
/// that ``___VARIABLE_productName___ViewController`` is allowed to access or invoke.
protocol ___VARIABLE_productName___PresentableListener: AnyObject {}
 
 

/// The visible region of `___VARIABLE_productName___RIB`.
final class ___VARIABLE_productName___ViewController: UIViewController {
    
    
    /// Reference to ``___VARIABLE_productName___Interactor``.
    weak var presentableListener: ___VARIABLE_productName___PresentableListener?
    
    
    /// Reference to the active (presented) `ViewControllable`.
    var activeFlow: (any ViewControllable)?
    
    
    /// Customization point that is invoked after self enters the view hierarchy.
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}



/// Conformance to the ``___VARIABLE_productName___ViewControllable`` protocol.
/// Contains everything accessible or invokable by ``___VARIABLE_productName___Router``.
extension ___VARIABLE_productName___ViewController: ___VARIABLE_productName___ViewControllable {
    
    
    /// Attaches the given `ViewControllable` into the view hierarchy, becoming the top-most view controller.
    /// - Parameter newFlow: The `ViewControllable` to be attached.
    /// - Parameter completion: A closure to be executed after the operation is complete.
    /// 
    /// > Note: You are responsible for removing the previous `ViewControllable` from the view hierarchy.
    func attach(newFlow: ViewControllable, completion: (() -> Void)?) {
        self.activeFlow = newFlow
        
        self.addChild(newFlow.uiviewController)
        self.view.addSubview(newFlow.uiviewController.view)
        newFlow.uiviewController.didMove(toParent: self)
        
        completion?()
    }
    
    
    /// Clears the  `ViewControllable` from the view hierarchy.
    /// - Parameter completion: A closure to be executed after the cleanup is complete.
    func clear(completion: (() -> Void)?) {
        self.activeFlow?.uiviewController.view.removeFromSuperview()
        self.activeFlow?.uiviewController.removeFromParent()
        
        self.activeFlow = nil
        
        completion?()
    }
    
}



/// Conformance extension to the ``___VARIABLE_productName___Presentable`` protocol.
/// Contains everything accessible or invokable by ``___VARIABLE_productName___Interactor``.
extension ___VARIABLE_productName___ViewController: ___VARIABLE_productName___Presentable {}
