//
//  SaveManager.swift
//  BlueToothPrj
//
//  Created by EricM on 1/6/21.
//

import Foundation

class SaveWeight {
    private init(){}
    static let saveWeight = SaveWeight()

    func saveData(weight: Weighted) throws {
        try persistenceHelper.save(newElement: weight)
    }
    private let persistenceHelper = PersistenceHelper<Weighted>(fileName: "saveWeight.plist")
    
    func getWeight()throws -> [Weighted]{
        return try persistenceHelper.getObjects()
    }
}
