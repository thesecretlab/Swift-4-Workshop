//: Playground - noun: a place where people can play

import Foundation

class Database {
    
    // Initialises lazily
    static let shared = Database()
    
    init () {
        print("\(type(of:self)) is loading!")
    }
    
    func loadData() -> String {
        return "loaded the data!"
    }
}

print(Database.shared.loadData())

