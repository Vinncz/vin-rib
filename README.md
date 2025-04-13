# Vin RIBs
An annotated and enriched version of Uber's iOS's RIBs framework. Made to consolidate my learnings, and to hopefully lessen the learning curve for you too.

Now with SwiftUI support, its big time for SwiftUI's declarative nature to be used ***alongside*** the decade-old UIKit framework, which RIBs is built upon.

## Installation
### Xcode 15.0+
1. Clone the repo
2. Copy all the `.xctemplate` folders, and paste them to `'/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File Templates'`.
3. Restart Xcode to apply changes.

### Statement from the RIBs team
For details on installation and usage, please see the [iOS tooling wiki page](https://github.com/uber/RIBs/wiki/iOS-Tooling).

### Prepare backups
When Xcode gets updated, the templates folder **will** be overwritten. 

Its best practice to create a backup of the templates folder, or even version them, so you can easily restore it after an Xcode update.

## Features

### Ancestral RIB (New)
The RIB that is the first to get attached to the RIBs tree--not listed within the official RIBs template.

In UIKit, build the ancestral RIB in the `AppDelegate` or `SceneDelegate`, and let it take control of UIKit's lifecycle.

```swift
// SceneDelegate.swift
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let wscene = (scene as? UIWindowScene) else { return }
    
    let window = UIWindow(windowScene: wscene)
    self.window = window
    
    let rootRouter = RootBuilder().build()
    
    self.rootRouter = rootRouter
            rootRouter.launch(from: window)
}
```

### SwiftUI RIB (New)
The RIB that is built to be used with SwiftUI. Comes with a `ViewModel` that lets SwiftUI interacts with the Interactor its part of.

```swift
final class BootstrapInteractor: PresentableInteractor<BootstrapPresentable>, BootstrapInteractable {
    private func configureViewModel() {
        viewModel.queOperationalFlow = { [weak self] in
            self?.listener?.didFinishPairing()
        }
        viewModel.quePairingFlow = { [weak self] in
            self?.router?.pairingFlow()
        }
    }
}

@Observable class BootstrapSwiftUIViewModel {
    var queOperationalFlow: (() -> Void)?
    var quePairingFlow: (() -> Void)?
    
}

struct BootstrapSwiftUIView: View {
    @Bindable var viewModel: BootstrapSwiftUIViewModel
    var body: some View {
        VStack {
            Button("Que Operational Flow") {
                viewModel.queOperationalFlow?()
            }
            Button("Que Pairing Flow") {
                viewModel.quePairingFlow?()
            }
        }
    }
}
```

### DocC Annotations
See which component uses which protocol at a glance. Using DocC, build the documentation and access the catalogue there.

```swift
/// Contract adhered to by ``RootRouter``, listing the attributes and/or actions 
/// that ``RootInteractor`` is allowed to access or invoke.
protocol RootRouting: ViewableRouting {
    func operationalFlow()
    func bootstrappingFlow()
}

/// Conformance to the ``RootPresentableListener`` protocol.
/// Contains everything accessible or invokable by ``RootViewController``.
extension RootInteractor: RootPresentableListener {}
```

## Remarks

None of the content herein or within were written in part nor in whole by generative AI.
