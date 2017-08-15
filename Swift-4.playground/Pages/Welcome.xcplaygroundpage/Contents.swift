//: [Previous](@previous)
//: # Welcome!
//: [Next](@next)
import UIKit

var myString : String? = "hello"

myString = nil

myString?.uppercased()

if let theString = myString {
    theString.uppercased()
}

/*
 Other languages:
 try {
     // code
 } catch (Exception e) {
     // handler
 }
*/

let openedData = try? Data(contentsOf: URL(string: "file:///doesnotexist")!)

do {
    let data = try Data(contentsOf: URL(string: "file:///doesnotexist")!)
    
    // code that can throw an error
} catch let error as NSError {
    print("Can't open the file \(error)")
} catch let error as Error {
    print("Can't open the file because of a different kind of error")
}

func guardDemo(name:String?) -> Int {
//    guard name == "Jon" else {
//        print("Only Jons allowed!")
//        return
//    }
//
//    // guaranteed that name == "Jon"
    
    if let theName = name {
        // theName is valid
    }
    
    guard let theName = name else {
        return 0
    }
    
    theName.uppercased()
    
    return 1
    

}

// Pyramid of doom
var optionalA : String?
var optionalB : String?
var optionalC : String?

if let a = optionalA {
    if let b = optionalB {
        
    }
}

func deferExample() {
    
    print("Entered function")
    
    defer {
        print("Exited function!")
    }
    
    defer {
        print("Exited function 2!")
    }
    
    print("Doing some work!")
    
    return
}

deferExample()

class Animal {
    var name : String = "Cat"
    
    
}

struct Point {
    var x : Int
    var y : Int
}

let myPoint = Point(x: 5, y: 3)

myPoint.y

var theCat = Animal()
theCat.name
var theOtherCat = theCat
theOtherCat.name = "The Other Cat"
theCat.name

var myOtherPoint = myPoint
myOtherPoint.y = 10
myPoint.y

if 1+1 == 2 {
    
    print("Entered the if block")
    
    defer {
        print("Exited the if block!")
    }
    
    print("I'm in the if block")
    
}





