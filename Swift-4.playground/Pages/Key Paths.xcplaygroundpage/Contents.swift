//: [Previous](@previous)
//: # Key paths
//: Key paths allow you to describe a "path" to a value, through multiple nested types.
import Foundation

// A driver has a vehicle, and a vehicle has a paint color

struct Driver {
    var name : String
    var vehicle : Vehicle
}

struct Vehicle {
    enum PaintColor {
        case red, green, blue
    }
    var color: PaintColor
}

// Create the key path to "the colour of the vehicle of a driver"
let carColor = \Driver.vehicle.color

/*:
 Note that the type of `carColor` depends on whether `Vehicle.color` is mutable.
 It will be `KeyPath` if `Vehicle.color` is `let`, and `WritableKeyPath` if `var`.
 */

// Create some objects to test with
var bigRedCar = Vehicle(color: .red)
var me = Driver(name: "Jon", vehicle: bigRedCar)

// Get a value via the key path
me[keyPath: carColor] // = .red
me[keyPath: carColor] = .green

// Changing values through key paths works the same as though
// you'd done it by hand
me.vehicle.color // = .green

//: [Next](@next)
