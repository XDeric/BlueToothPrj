//
//  weightHash.swift
//  BlueToothPrj
//
//  Created by EricM on 12/10/20.
//

import UIKit

struct Weight: Hashable {
    let weight: Int
    let identifier = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}
