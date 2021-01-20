//
//  weightHash.swift
//  BlueToothPrj
//
//  Created by EricM on 12/10/20.
//

import UIKit

struct SavedWeightData: Hashable, Codable {
    let id: Int
    let lbs: Int
    let time: String
    
    var identifier = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}
