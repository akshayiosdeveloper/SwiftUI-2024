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

**Why Use @ObservedObject?**
Data Synchronization: Keeps data consistent between parent and child views.
Separation of Concerns: Encapsulates business logic in an external model class.
Reactive UI: Automatically updates the view when data changes.

Prefer @StateObject over @ObservedObject when creating the object inside the view to avoid reinitialization.
Use @EnvironmentObject when you need to share state globally across many views.
