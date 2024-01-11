//
//  FileManager+Spell.swift
//  InvokerApp
//
//  Created by Yuga Samuel on 11/01/24.
//

import Foundation

extension FileManager {
    static var getDocumentsDirectory: URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
}
