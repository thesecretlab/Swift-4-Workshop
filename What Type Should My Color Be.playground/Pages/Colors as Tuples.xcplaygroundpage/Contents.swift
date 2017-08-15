/*:
[Previous](@previous)
 
# Colors as Tuples
 
The advantage of storing colors as a single integer is that the red, green and blue values are kept together, which is convenient.

In Swift, we can keep related values together using tuples, like so:
 */
let pearTuple = (209, 226, 49)

pearTuple.0 // = 209
//: We could even go one further and create a type-alias for this kind of tuple, and add names for each of the tuple components
typealias Color = (red: UInt8, green: UInt8, blue: UInt8)

var pearColor : Color = (209, 226, 49)
//: What's really nice about this is how we can refer to each component by name, as well as making changes:
pearColor.red = 201
//: This is nicer, and if all we cared about was working with colours as bundles of numbers, we could stop here. But there's more we can do.
//:
//: [Next](@next)
