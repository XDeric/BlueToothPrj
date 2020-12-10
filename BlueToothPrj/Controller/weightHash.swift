//
//  weightHash.swift
//  BlueToothPrj
//
//  Created by EricM on 12/10/20.
//

import UIKit


//class Weight: Hashable {
//    
//    func hash(into hasher: inout Hasher) {
//      hasher.combine(ObjectIdentifier(self))
//    }
//    
//    static func == (lhs: weight, rhs: weight) -> Bool {
//        return lhs === rhs
//    }
//    
//    
//}

struct Weight: Hashable {
    let weight: Int
    let identifier = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}
