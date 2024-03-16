//
//  Item.swift
//  TodoSharingSNS
//
//  Created by Taichi on 2024/03/16.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
