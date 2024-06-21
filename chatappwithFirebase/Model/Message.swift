//
//  Message.swift
//  chatappwithFirebase
//
//  Created by stenio Lima on 20/06/24.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
