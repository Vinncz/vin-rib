import Foundation
import RIBs
import RxSwift
import SnapKit
import SwiftUI
import UIKit



/// Contract adhered to by ``___VARIABLE_productName___Interactor``, listing the attributes and/or actions 
/// that ``___VARIABLE_productName___ViewController`` is allowed to access or invoke.
protocol ___VARIABLE_productName___PresentableListener: AnyObject {}
 
 

/// The visible region of `___VARIABLE_productName___RIB`.
final class ___VARIABLE_productName___ViewController: UIViewController {
    
    
    /// Reference to ``___VARIABLE_productName___Interactor``.
    weak var presentableListener: ___VARIABLE_productName___PresentableListener?
    
    
    /// Reference to ``___VARIABLE_productName___SwiftUIViewModel``.
    weak var viewModel: ___VARIABLE_productName___SwiftUIViewModel?
    
    
    /// The SwiftUI view that is displayed by this view controller.
    var hostingController: UIHostingController<___VARIABLE_productName___SwiftUIView>?
    
    
    /// Customization point that is invoked after self enters the view hierarchy.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard hostingController != nil else {
            buildHostingController()
            return
        }
    }
    
    
    /// Constructs an instance of ``___VARIABLE_productName___SwiftUIView``, wraps them into `UIHostingController`,
    /// and sets it as the root view of this view controller.
    func buildHostingController() {
        guard let viewModel else { fatalError("ViewModel wasn't yet set.") }
        
        let swiftUIView = ___VARIABLE_productName___SwiftUIView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: swiftUIView)
        
        self.addChild(hostingController)
        self.view.addSubview(hostingController.view)
        
        hostingController.view.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        hostingController.didMove(toParent: self)
        self.hostingController = hostingController
    }
    
}



/// Conformance to the ``___VARIABLE_productName___ViewControllable`` protocol.
/// Contains everything accessible or invokable by ``___VARIABLE_productName___Router``.
extension ___VARIABLE_productName___ViewController: ___VARIABLE_productName___ViewControllable {}



/// Conformance extension to the ``___VARIABLE_productName___Presentable`` protocol.
/// Contains everything accessible or invokable by ``___VARIABLE_productName___Interactor``.
extension ___VARIABLE_productName___ViewController: ___VARIABLE_productName___Presentable {
    
    
    /// Binds the ``___VARIABLE_productName___SwiftUIViewModel`` to the view controller.
    func bind(viewModel: ___VARIABLE_productName___SwiftUIViewModel) {
        self.viewModel = viewModel
    }
    
    
    /// Unbinds the ``___VARIABLE_productName___SwiftUIViewModel`` from the view controller.
    func unbindViewModel() {
        self.viewModel = nil
    }
    
}
