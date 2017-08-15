//
//  DataEntry.swift
//  Assignment1
//
//  Created by Jon Manning on 15/8/17.
//  Copyright © 2017 Secret Lab. All rights reserved.
//

import Foundation

class DataManager  {
    static let shared = DataManager()
    
    var dataItems : [DataEntry] = []
    
    init() {
        loadData()
    }
    
    var documentsURL : URL {
        let documentURL = FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first!
            .appendingPathComponent("data.json")
        
        return documentURL
    }
    
    func loadData()  {
        
        do {
            let data = try Data(contentsOf: documentsURL)
            dataItems = try JSONDecoder().decode(Array<DataEntry>.self, from: data)
            
            dataItems.sort { (item1, item2) -> Bool in
                return item1.created > item2.created
            }
        } catch {
            dataItems = []
        }
        
    }
    
    func saveData() {
        do {
            let data = try JSONEncoder().encode(dataItems)
            
            try data.write(to: documentsURL)
            
        } catch let error {
            NSLog("Failed to write: \(error)")
        }
    }
    
    func createNewEntry() -> DataEntry {
        let entry = DataEntry()
        
        dataItems.insert(entry, at: 0)
        
        return entry
    }
    
}

class DataEntry : Codable {
    
    var data : String
    
    var created : Date
    
    init(data: String = "") {
        self.data = data
        self.created = Date()
    }
}

