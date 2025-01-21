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

