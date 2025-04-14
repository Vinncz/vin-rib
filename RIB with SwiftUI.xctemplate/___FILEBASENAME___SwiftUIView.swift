import SwiftUI



/// The SwiftUI View that is bound to be presented in ``___VARIABLE_productName___ViewController``.
struct ___VARIABLE_productName___SwiftUIView: View {
    
    
    /// Two-ways communicator between ``___VARIABLE_productName___Interactor`` and self.
    @Bindable var viewModel: ___VARIABLE_productName___SwiftUIViewModel
    
    
    var body: some View {
        Text("Hello from ___VARIABLE_productName___SwiftUIView")
    }
    
}



#Preview {
    @Previewable var viewModel = ___VARIABLE_productName___SwiftUIViewModel()
    ___VARIABLE_productName___SwiftUIView(viewModel: viewModel)
}
