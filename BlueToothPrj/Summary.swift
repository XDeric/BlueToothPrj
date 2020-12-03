//
//  Summary.swift
//  BlueToothPrj
//
//  Created by EricM on 12/3/20.
//

import Foundation

// MARK: - Summary
struct Summary: Codable {
    let countries: [Country]
    
    enum CodingKeys: String, CodingKey {
        case countries = "Country"
    }
}

// MARK: - Country
struct Country: Codable {
    let country: String
    let totalConfirmed, totalRecovered : Int

    enum CodingKeys: String, CodingKey {
        case country = "Country"
        case totalConfirmed = "TotalConfirmed"
        case totalRecovered = "TotalRecovered"
    }
}
