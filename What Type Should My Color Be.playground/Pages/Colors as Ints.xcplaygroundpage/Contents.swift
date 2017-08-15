/*:
 
[Previous](@previous)
 
# Colors as `Int`s

We can encode the three values for red green and blue into a single 32-bit integer.
 
> Technically, we only need 24 bits for this, because 8×3 = 24, but Swift only provides integers in sizes that are powers of two, so we only have `Int`s that are 8, 16, 32, and 64 bits in size.
 
Typically, colours that are stored in integers are expressed in hexadecimal notation, because it's an easy way to separate each of the three bytes (because each byte can be represented as 2 hex digits.)
 
Let's create an integer that encodes this colour.*/
// red = 209, green = 226, blue = 49
let pear = 0xd1e231
//: To extract the colour values from this, we have to do bit-shifting.
let pearRed = (pear & 0xff0000) >> 16 // = 209
let pearGreen = (pear & 0x00ff00) >> 8 // = 226
let pearBlue = (pear & 0x0000ff) >> 0 // = 49
//: To encode the values, we have to bitshift in the opposite direction.
func coloursToHex(red: UInt8, green: UInt8, blue: UInt8) -> UInt32 {
    return UInt32(red) << 16
        | UInt32(green) << 8
        | UInt32(blue)
}

let encodedPear = coloursToHex(red: 209, green: 226, blue: 49)
//: We can convert this number back into a hexadecimal representation.
String(encodedPear, radix: 16) // = "d1e231"
//: Lots of languages and frameworks encode colour this way, and it totally works, but is messy and clunky. There are other, better ways.
//:
//: [Next](@next)
