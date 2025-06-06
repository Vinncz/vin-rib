import RIBs
import RxSwift



/// Contract adhered to by ``___VARIABLE_productName___Router``, listing the attributes and/or actions 
/// that ``___VARIABLE_productName___Interactor`` is allowed to access or invoke.
protocol ___VARIABLE_productName___Routing: ViewableRouting {
    
    
    /// Removes the view hierarchy from any `ViewControllable` instances this RIB may have added.
    func clearViewControllers()
    
    
    /// Removes the hosting controller (swiftui embed) from the view hierarchy and deallocates it.
    func detachSwiftUI()
    
}



/// Contract adhered to by ``___VARIABLE_productName___ViewController``, listing the attributes and/or actions
/// that ``___VARIABLE_productName___Interactor`` is allowed to access or invoke.
protocol ___VARIABLE_productName___Presentable: Presentable {
    
    
    /// Reference to ``___VARIABLE_productName___Interactor``.
    var presentableListener: ___VARIABLE_productName___PresentableListener? { get set }
    
    
    /// Binds the view model to the view.
    func bind(viewModel: ___VARIABLE_productName___SwiftUIViewModel)
    
    
    /// Unbinds the view model from the view.
    func unbindViewModel()
    
}



/// Contract adhered to by the Interactor of `___VARIABLE_productName___RIB`'s parent, listing the attributes and/or actions
/// that ``___VARIABLE_productName___Interactor`` is allowed to access or invoke.
protocol ___VARIABLE_productName___Listener: AnyObject {}



/// The functionality centre of `___VARIABLE_productName___RIB`, where flow, communication, and coordination
/// are determined and initiated from.
final class ___VARIABLE_productName___Interactor: PresentableInteractor<___VARIABLE_productName___Presentable>, ___VARIABLE_productName___Interactable {
    
    
    /// Reference to ``___VARIABLE_productName___Router``.
    weak var router: ___VARIABLE_productName___Routing?
    
    
    /// Reference to this RIB's parent's Interactor.
    weak var listener: ___VARIABLE_productName___Listener?
    
    
    /// Reference to the component of this RIB.
    var component: ___VARIABLE_productName___Component
    
    
    /// Bridge to the ``___VARIABLE_productName___SwiftUIVIew``.
    private var viewModel = ___VARIABLE_productName___SwiftUIViewModel()
    
    
    /// Constructs an instance of ``___VARIABLE_productName___Interactor``.
    /// - Parameter component: The component of this RIB.
    init(component: ___VARIABLE_productName___Component, presenter: ___VARIABLE_productName___Presentable) {
        self.component = component
        
        super.init(presenter: presenter)
        
        presenter.presentableListener = self
    }
    
    
    /// Customization point that is invoked after self becomes active.
    override func didBecomeActive() {
        super.didBecomeActive()
        configureViewModel()
    }
    
    
    /// Customization point that is invoked before self is fully detached.
    override func willResignActive() {
        super.willResignActive()
        presenter.unbindViewModel()
        router?.clearViewControllers()
        router?.detachSwiftUI()
    }
    
    
    /// Configures the view model.
    private func configureViewModel() {
        // TODO: Configure the view model.
        presenter.bind(viewModel: self.viewModel)
    }
    
}



/// Conformance to the ``___VARIABLE_productName___PresentableListener`` protocol.
/// Contains everything accessible or invokable by ``___VARIABLE_productName___ViewController``.
extension ___VARIABLE_productName___Interactor: ___VARIABLE_productName___PresentableListener {}
