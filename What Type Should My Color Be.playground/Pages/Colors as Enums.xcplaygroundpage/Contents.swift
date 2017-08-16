import Foundation

//: [Previous](@previous)
//:
//: # Colors as Enums
//:
//: Let's take a specific use case for colors: representing colors in CSS.
//:
//: In CSS, there are multiple ways to represent a colour:
//:
//: * By name: `red`, `green`, `chartreuse`
//: * As hex values: `#d1e231`
//: * As red-green-blue triplets: rgb(209, 226, 49)
//: * As hue-saturation-value triplets: hsv(66, 78, 89)
//:
//: Wouldn't it be nicer if we had one type to represent all this?
//:
//: An enumeration can be used for all of these representations, and all in the same type!
enum Color {
    
    // A name for colours. This type is embedded into the parent `Color` type.
    // By associating this enum with String, Swift will automatically associate
    // each value with a string.
    enum Name : String {
        case red , green, blue, grey, chartreuse
    }
    
    // A named color
    case named(name: Name)
    
    // An RGB color
    case rgb(red: UInt8, green: UInt8, blue: UInt8)
    
    // An HSV color
    case hsv(hue: UInt8, saturation: UInt8, value: UInt8)
    
    // A color expressed with a hex integer
    case hex(value: UInt32)
}
//: We can create colors with different representations by using different cases in the enumeration.
let pearNamed = Color.named(name: .chartreuse)
let pear = Color.rgb(red: 209, green: 226, blue: 49)
//: We use the `switch` statement to access it.

switch pear {
// If this is an RGB, then match it and extract the values
case .rgb(let r, _, _):
    r // = 209
default:
    // Any other case, we ignore it
    break
}

//: We can also use "if case" to match a single specific case. This is a slightly simpler way to access the associated values of an enumeration.
if case .rgb(let r, _, _) = pear {
    r // = 209
}

//: Note: `guard case` works similarly.
//:
//: We can also customise how this type represents itself as a string, by conforming to the `CustomStringConvertible` protocol.
extension Color: CustomStringConvertible {
    var description: String {
        switch self {
        case .rgb(let r, let g, let b):
            return "rgb(\(r), \(g), \(b))"
        case .hsv(let h, let s, let v):
            return "hsv(\(h), \(s), \(v))"
        case .hex(let value):
            return "#\(String(format: "%06x", value))"
        case .named(let name):
            return name.rawValue
        }
    }
    
}

Color.named(name: .grey).description // = "grey"
Color.hex(value: 0xff0000).description // = "#ff0000"
//: Finally, let's take this all back to where we started. We can tell the Swift language that it's possible to directly convert an integer literal into our `Color` type, by conforming to the `ExpressibleByIntegerLiteral` protocol.
extension Color : ExpressibleByIntegerLiteral {
    
    init(integerLiteral value: Int32) {
        
        // Bit-shift each component and reduce them to a UInt8
        let r = UInt8(value >> 16 & 0x0000ff)
        let g = UInt8(value >>  8 & 0x0000ff)
        let b = UInt8(value >>  0 & 0x0000ff)
        
        // Produce a new RGB color from these components
        self = .rgb(red: r, green: g, blue: b)
    }
    
}
//: We can now directly convert from hex colors (actually, any integer)
let pearTheSequel : Color = 0xD1E231
//: [Next](@next)
