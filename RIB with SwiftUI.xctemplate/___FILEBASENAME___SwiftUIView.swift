import SwiftUI

struct ___VARIABLE_productName___SwiftUIView: View {
    
    @Bindable var viewModel: ___VARIABLE_productName___SwiftUIViewModel
    
    var body: some View {
        Text("Hello from ___VARIABLE_productName___SwiftUIView")
    }
    
}



#Preview {
    @Previewable var viewModel = ___VARIABLE_productName___SwiftUIViewModel()
    ___VARIABLE_productName___SwiftUIView(viewModel: viewModel)
}
