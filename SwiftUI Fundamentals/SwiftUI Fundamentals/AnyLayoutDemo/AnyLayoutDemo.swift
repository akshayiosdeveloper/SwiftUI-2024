//
//  AnyLayoutDemo.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 07/01/25.
//

import SwiftUI

struct AnyLayoutDemo: View {
    @State private var changeLayout = false
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
       // let layout = changeLayout ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
        let layout = horizontalSizeClass == .regular ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
        layout {
        Image(systemName: "bus")
        .font(.system(size: 80))
        .frame(width: 120, height: 120)
        .background(in: RoundedRectangle(cornerRadius: 5.0))
        .backgroundStyle(.green)
        .foregroundColor(.white)
        Image(systemName: "ferry")
        .font(.system(size: 80))
        .frame(width: 120, height: 120)
        .background(in: RoundedRectangle(cornerRadius: 5.0))
        .backgroundStyle(.yellow)
        .foregroundColor(.white)
        Image(systemName: "scooter")
        .font(.system(size: 80))
        .frame(width: 120, height: 120)
        .background(in: RoundedRectangle(cornerRadius: 5.0))
        .backgroundStyle(.indigo)
        .foregroundColor(.white)
        }
        .animation(.default, value: changeLayout)
        .onTapGesture {
            changeLayout.toggle()
        }
    }
}
#Preview {
    AnyLayoutDemo()
}

// A Person struct that will be identifiable and contain  properties for name age
 
struct Person: Identifiable {
    var id = UUID()
    var name: String
    let age: Int
    var hobbies: Hobby
    // A static array of Person called sample People
    static let samplePeople: [Person] = [
        Person(name: "Akshay", age: 25, hobbies: .coding),
        Person(name: "Ankit", age: 26, hobbies: .hiking),
        Person(name: "Shubham", age: 27, hobbies:.reading),
        Person(name: "Rishabh", age: 28, hobbies:.reading),
    ]
}





// An enum representing a number of hobbies
enum Hobby {
    case coding
    case reading
    case hiking
    // A computed property that will return a string representing an SFSymbol for each of the cases
        
        
    var symbol: String {
        switch self {
        case .coding: return "globe"
        case .reading: return "book"
        case .hiking: return "utensils"
        }
    }
}
