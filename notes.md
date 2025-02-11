State management in SwiftUI is built into the framework using property wrappers like @State, @Binding, @Environment, @StateObject, and @ObservedObject. 
These tools help you manage and share state efficiently across views in a declarative way.

Key Property Wrappers for State Management

**=======    @State:     ========**
A property wrapper type that can read and write a value managed by SwiftUI.


Used for simple, local state within a single view.
SwiftUI automatically updates the UI when the state changes.

Each SwiftUI view is struct-based, meaning it is recreated every time the view hierarchy is updated.
Variables in a struct are immutable by default. To have a mutable variable that persists across view updates, @State is necessary.

**When Should You Use @State?**

Local State:
Use @State for variables that only matter to a single view (e.g., counters, toggles, text fields).
Not Shared:
If the state doesn’t need to be passed to other views, @State is perfect.
Simple Logic:
For more complex or shared logic, use @StateObject or @ObservedObject.

**What Happens Internally with @State?

When you declare a property as @State, SwiftUI:**

Stores the value in a special memory location outside the view struct.
Creates a connection between the state and the view hierarchy.
Tracks changes to the state and triggers a re-render of the affected view when the value changes.

**===== @Binding: =======**

Binding in SwiftUI creates a two-way connection between a view and its state. It allows one view to read and write to a state owned by another view.

**This is useful when:**

A child view needs to modify a state from its parent.
You need a two-way data flow between views.
UI elements such as sliders, toggles, or text fields need to update external state variables.
**** ========= How Binding Works =============****

A @State property stores the data, while $ creates a binding reference to pass it to child views.

**How This Works:**
The ParentView has a @State variable called isOn.
The $isOn binding is passed to ChildToggleView, which uses @Binding.
Changes in the child toggle directly update the parent’s state.

**Key Points**

Use @State for local state.
Use @Binding to pass state from parent to child for two-way data flow.
Prefix the state variable with $ when passing it as a binding.
Avoid using @Binding in views that directly own the state; use @State instead.

**Why Use Binding?** 

State Sharing: Makes it easy to share and modify state between parent and child views.
Two-Way Data Flow: Ensures the UI stays in sync with state changes.
Reusable Views: Allows building reusable and modular components by letting the parent manage the state.

**Understanding @ObservedObject in SwiftUI**<br>
****What is @ObservedObject?**<br>**
@ObservedObject is a property wrapper in SwiftUI used to observe changes in an external object and update the UI when those changes occur.

Unlike @State, which is used for internal state within a view, @ObservedObject is designed for state shared between multiple views. The observed object must conform to the ObservableObject protocol and notify changes using the @Published property.
**When to Use @ObservedObject**<br>
When a stateful model object needs to be shared between multiple views.
When you want to decouple business logic from UI logic.
When the object’s state is updated outside the view.

**Why Use @ObservedObject?**<br>
Data Synchronization: Keeps data consistent between parent and child views.
Separation of Concerns: Encapsulates business logic in an external model class.
Reactive UI: Automatically updates the view when data changes.

Prefer @StateObject over @ObservedObject when creating the object inside the view to avoid reinitialization.
Use @EnvironmentObject when you need to share state globally across many views.

**Why Prefer @StateObject Over @ObservedObject When Creating the Object Inside the View**<br>
**Key Difference<br>**
@StateObject: Initializes and owns the lifecycle of an object within the view. It's created once and persists across view updates (like re-rendering).
@ObservedObject: Expects the object to be created and managed outside the view. It observes the object for changes but does not control its lifecycle.
**Why Prefer @StateObject**<br>
When you create an instance of an observable object inside a view, SwiftUI might recreate the view during state updates, causing the object to be reinitialized. This leads to unwanted behaviors, such as resetting the state or losing data.

@StateObject ensures the object is initialized only once and survives the view's lifecycle.

**When to Use @ObservedObject**<br>
Use @ObservedObject when the view receives the object from an external source, such as from a parent view:

**Summary<br>
Property Wrapper	Use Case**<br>
@StateObject	When the view creates and owns the object to manage its lifecycle
@ObservedObject	When the object is provided from outside and just needs observation

**Summary**<br>
Use @StateObject to create and own the object inside the view.
Use @ObservedObject to observe an externally provided object.
The difference becomes noticeable when views are recreated due to state changes.

**@Environment **<br>
==
is a property wrapper used to access shared data or environment values that are provided by the environment of a view hierarchy. It helps manage and pass data efficiently without manually passing it through every child view.

**How @Environment Works**<br>
The @Environment property wrapper allows your views to access system-defined values or custom environment values, such as:

System values: Like color schemes, accessibility settings, or size classes.
Custom environment values: Values defined by developers using environment(_:).

