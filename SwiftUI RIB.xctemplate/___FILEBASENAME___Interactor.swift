import RIBs
import RxSwift



/// Interface exposed by ``___VARIABLE_productName___Router`` to enable RIB tree manipulation.
protocol ___VARIABLE_productName___Routing: ViewableRouting {
    
    
    /// Removes any `ViewControllable` this RIB may have added to the view hierarchy.
    func clearViewControllers()
    
    
    /// Removes the hosting controller (SwiftUI embed) from the view hierarchy and deallocates it.
    func detachSwiftUI()
    
}



/// Interface exposed by ``___VARIABLE_productName___ViewController`` to enable view manipulation.
protocol ___VARIABLE_productName___Presentable: Presentable {
    
    
    /// Reference to ``___VARIABLE_productName___Interactor``.
    var presentableListener: ___VARIABLE_productName___PresentableListener? { get set }
    
    
    /// Binds the view model to the view.
    /// - Parameter viewModel: The view model to bind.
    func bind(viewModel: ___VARIABLE_productName___ViewModel)
    
    
    /// Unbinds the view model from the view.
    func unbindViewModel()
    
}



/// Interface exposed by the Interactor of `___VARIABLE_productName___RIB`'s parent. 
/// 
/// Listener protocols enables vertical communication between RIBs.
protocol ___VARIABLE_productName___Listener: AnyObject {}



/// Implements business logic and lifecycle coordination for `___VARIABLE_productName___RIB`.
///
/// Acts as the source of truth for state, handles user intent, and delegates navigation to the router.
final class ___VARIABLE_productName___Interactor: PresentableInteractor<___VARIABLE_productName___Presentable>, ___VARIABLE_productName___Interactable {
    
    
    /// Reference to ``___VARIABLE_productName___Router``.
    weak var router: ___VARIABLE_productName___Routing?
    
    
    /// Reference to this RIB's parent's Interactor.
    weak var listener: ___VARIABLE_productName___Listener?
    
    
    /// Reference to the component of this RIB.
    var component: ___VARIABLE_productName___Component
    
    
    /// Bridge to the ``___VARIABLE_productName___SwiftUIVIew``.
    private var viewModel = ___VARIABLE_productName___ViewModel()
    
    
    /// Initializes an instance of ``___VARIABLE_productName___Interactor``.
    /// 
    /// - Parameters:
    ///   - component: The component of this RIB.
    ///   - presenter: The view controller that conforms to ``___VARIABLE_productName___Presentable``.
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
/// Contains methods that can be invoked by ``___VARIABLE_productName___ViewController``.
extension ___VARIABLE_productName___Interactor: ___VARIABLE_productName___PresentableListener {
    
    
    /// Informs ``___VARIABLE_productName___Router`` that the navigation controller has exited the view hierarchy; 
    /// commonly due to being popped off a navigation stack or dismissed.
    func didExitViewHierarchy() {
        router?.clearViewControllers()
    }
    
}
