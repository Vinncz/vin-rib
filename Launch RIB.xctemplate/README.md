# ___VARIABLE_productName___RIB
An ancestral RIB. Every other RIB is a descendant of this RIB. Is classified as a `LaunchRIB`.

## Topics
### Composing the RIB
Defines the dependency graph and builds the module using the Builder pattern.
- ``___VARIABLE_productName___Dependency``
- ``___VARIABLE_productName___Component``
- ``___VARIABLE_productName___Buildable``
- ``___VARIABLE_productName___Builder``

### Managing the RIB Hierarchy
Handles the structural relationships between this RIB and its children.
- ``___VARIABLE_productName___Routing``
- ``___VARIABLE_productName___Router``

### Performing Business Logics
Implements the core logic and state of the RIB.
- ``___VARIABLE_productName___Interactable``
- ``___VARIABLE_productName___Interactor``

### Communicating with Parent RIBs
- ``___VARIABLE_productName___Listener``

### Views
Concrete view layers implemented with UIKit or SwiftUI.
- ``___VARIABLE_productName___ViewController``

### Presenting a View
Defines how the router presents or removes views in the UI hierarchy.
- ``___VARIABLE_productName___ViewControllable``

### Interactor-driven View Manipulation
Interfaces for updating or binding view state from the interactor.
- ``___VARIABLE_productName___Presentable``

### Responding to View Events
Interfaces for receiving user events and view lifecycle callbacks.
- ``___VARIABLE_productName___PresentableListener``

@Metadata {
    @TitleHeading("Documentation Group")
    @PageColor(gray)
}
