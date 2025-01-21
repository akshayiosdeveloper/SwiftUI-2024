Q: How do you create a reusable SwiftUI component that takes a closure as a parameter?
struct ReusableButton: View {  
    let title: String  
    let action: () -> Void  

    var body: some View {  
        Button(title, action: action)  
            .padding()  
            .background(Color.blue)  
            .foregroundColor(.white)  
            .cornerRadius(8)  
    }  
}  

ReusableButton(title: "Click Me") {  
    print("Button clicked!")  
} 

============ 21 JAN 2025 =====
**What are the key principles of declarative programming in SwiftUI?**
Focus on what the UI should look like based on the current state, not how to update it.
Views are rebuilt automatically when the state changes, using a reactive data-driven approach.

**What is the difference between @AppStorage and @State?**
@State: Stores temporary state for a view.
@AppStorage: Persists values in UserDefaults, allowing data to persist across app launches.

**How does SwiftUI handle dependency injection?**
Using property wrappers like @EnvironmentObject and @Environment, SwiftUI enables injecting shared or environment-level dependencies into views.
**What is the role of the .id() modifier in SwiftUI?**
The .id() modifier provides a unique identifier for views to force their recreation when the ID changes.
