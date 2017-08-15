//: [Previous](@previous)
//:
//: # Colors as Objects
//:
//: Object-oriented programming suggests that we should think of colours as 'objects', which have properties and methods. Let's try that out by creating a Color class.

import Foundation
import UIKit

struct Color {
    
    var red : UInt8
    var green : UInt8
    var blue : UInt8
    
}
//: This is verbose, but works pretty nicely.
let pear = Color(red: 209, green: 226, blue: 49)
//: Because we're working with a type that we defined, we can do stuff like add extension methods and properties:
extension Color : CustomStringConvertible {
    var description: String {
        // Convert the color into a hex string
        return [red,green,blue] // take the three components
            .map { String(format: "%02x", $0) } // convert each component to a hex
                                                // string, padded with a zero if necessary
            .reduce("", { $0 + $1 })            // reduce these strings into a single string
    }
    
    var color: UIColor {
        // convert each component into a CGFloat that ranges from 0 to 1
        var floats = [red,green,blue]
            .map { CGFloat($0) / 255 }
        
        // Generate and return the color
        return UIColor(red: floats[0],
                       green: floats[1],
                       blue: floats[2],
                       alpha: 1.0)
    }
}

pear.description // = "d1e231"
pear.color
//: Additionally, because structs are value types, we can pass them around and not worry about accidentally changing someone else's colour
var pearTheSequel = pear

pearTheSequel.red = 100
pearTheSequel.color

pear.red // = 209

//: So far, we've been looking at a specific representation of a colour: red, green, and blue. However, that's not the only way to represent colours, and if we wanted to have different options, we'd need to have a different struct. But there's a better way.
//: 
//: [Next](@next)
