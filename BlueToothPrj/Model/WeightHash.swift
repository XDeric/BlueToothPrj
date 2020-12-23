//
//  weightHash.swift
//  BlueToothPrj
//
//  Created by EricM on 12/10/20.
//

import UIKit

struct Weight: Hashable {
    let weight: Int
    var time: String{
        get {
            let currentTime = Date()
            let format = DateFormatter()
            format.timeStyle = .medium
            format.dateStyle = .medium
            return format.string(from: currentTime)
        }
    }
    let identifier = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}
