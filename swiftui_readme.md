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


