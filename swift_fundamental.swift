What is a Protocol?
A protocol defines a blueprint of methods, properties, and other requirements that a class, structure, or enumeration must implement.

Think of protocols as contracts that types agree to follow.
Protocols don’t provide implementations; they only specify what should be implemented.

==example==
protocol Vehicle {
    var speed: Double { get set } // Property
    func startEngine()           // Method
    func stopEngine()            // Method
}

class Car: Vehicle {
    var speed: Double = 0.0
    
    func startEngine() {
        print("Car engine started.")
    }
    
    func stopEngine() {
        print("Car engine stopped.")
    }
}

// Usage
let car = Car()
car.startEngine()
car.speed = 60.0
print("Speed: \(car.speed)")

===    Key Features of Protocols  ====
Multiple Protocol Conformance
A type can conform to multiple protocols.

protocol Drivable {
    func drive()
}

protocol Repairable {
    func repair()
}

struct Truck: Drivable, Repairable {
    func drive() {
        print("Truck is driving.")
    }

    func repair() {
        print("Truck is being repaired.")
    }
}


2) Protocol Composition
Combine multiple protocols into one requirement using &.

func performTask(vehicle: Vehicle & Drivable) {
    vehicle.startEngine()
    vehicle.drive()
}
3) Optional Requirements (for @objc Protocols)
Protocols marked with @objc can have optional methods.

@objc protocol OptionalExample {
    @objc optional func optionalMethod()
}

class ExampleClass: OptionalExample {
    // No need to implement `optionalMethod` unless required.
}

4) Protocol Extensions
Extensions allow adding functionality to protocols, including default method implementations.
This is the foundation of protocol-oriented programming.
swift
Copy
Edit

Associated Types in Protocols
An associated type in a protocol is a placeholder for a type that will be specified later, when the protocol is adopted. It allows you to define flexible and reusable protocols that work with different types without being tied to a specific one.

//------ Clousures----------- 

Trailing Clousure :
A trailing closure is a Swift feature that makes code more readable when the last parameter of a function is a closure. Instead of passing the closure inside the function's parentheses, you write it outside, after the function call. This is especially useful when the closure is long or complex.
Summary of Trailing Closure Scenarios
Scenario	Example
Network Requests	Fetching data from an API and handling the result with a trailing closure.
Animations	Defining animation behavior and completion logic with trailing closures.
Sorting/Filtering	Using trailing closures with higher-order functions like sorted, map, etc.
Key Benefits of Trailing Closures
Improved Readability:

Trailing closures make the code cleaner, especially when the closure is long or contains multiple lines of logic.

Separation of Concerns:

The function call and the closure logic are visually separated, making the code easier to understand.

Common in Real-World Code:

Trailing closures are widely used in Swift for asynchronous tasks, animations, and higher-order functions.
