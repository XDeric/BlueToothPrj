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
    
    static func getWeights(from data: Data) throws -> WeightData{
        do{
            let weights = try JSONDecoder().decode(WeightData.self, from: data)
            return weights
        } catch { throw JsonError.decodingError(error)}
    }
}

enum JsonError: Error{
    case decodingError(Error)
}

// MARK: - Weighted
struct Weighted: Codable, Hashable{
    let id, lbs: Int
}
