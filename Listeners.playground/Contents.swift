//: Playground - noun: a place where people can play

import UIKit


// Maintains a list of weakly-referenced listeners; if a listener de-inits,
// it's automatically removed from the list
class EventManager {
    
    // Save us having to specify the full type every time
    typealias Handler = () -> ()
    
    // An object that wraps a block.
    class Listener {
        
        var handler : Handler
        
        init(handler: @escaping Handler) {
            self.handler = handler
        }
        
    }
    
    // A wrapper around a weak reference to an object.
    struct WeakRef<T> where T : AnyObject {
        private (set) weak var value : T?
        
        init (value: T) {
            self.value = value
        }
    }
    
    // Our list of weak references to Listener objects
    var listeners : [WeakRef<Listener>] = []
    
    func addListener(listener: @escaping Handler) -> EventManager.Listener {
        // Make the listener
        let listener = Listener(handler: listener)
        
        // Add the weak reference
        listeners.append(WeakRef(value: listener))
        
        // Return the listener
        return listener
    }
    
    // Send a message to all listeners that still exist
    func broadcast() {
        // Tidy up the list by first removing any weak reference that has become nil
        listeners = listeners.filter { $0.value != nil }
        
        // Call all handlers
        listeners.map { $0.value?.handler() }
    }
    
}


// Create our manager
let manager = EventManager()

// Add two listeners
var listenerA : EventManager.Listener? = manager.addListener {
    print("Listener A handling a message!")
}
var listenerB : EventManager.Listener? = manager.addListener {
    print("Listener B handling a message!")
}

// Test it out; we'll get two messages
print("Sending to two listeners")
manager.broadcast()

// Remove one of the listeners; it will automatically end up removed
// from 'manager's list
listenerB = nil

// Now we'll only get one message
print("Sending to one listeners")
manager.broadcast()
