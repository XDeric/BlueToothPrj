//
//  WeightJsonDecoder.swift
//  BlueToothPrj
//
//  Created by EricM on 12/28/20.
//

import Foundation

// MARK: - WeightData
struct WeightData: Codable{
    let weight: [Weighted]

    enum CodingKeys: String, CodingKey {
        case weight = "Weight"
    }
}

// MARK: - Weight
struct Weighted: Codable{
    let id, lbs: Int
}
