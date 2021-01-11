//
//  SaveManager.swift
//  BlueToothPrj
//
//  Created by EricM on 1/6/21.
//

import Foundation

class SaveWeight {
    private init(){}
    static let saveManager = SaveWeight()
    private let persistenceHelper = PersistenceHelper<SavedWeightData>(fileName: "saveWeight.plist")

    func saveData(weight: SavedWeightData) throws {
        try persistenceHelper.save(newElement: weight)}
    
    func getWeight()throws -> [SavedWeightData]{
        return try persistenceHelper.getObjects()
    }
}
