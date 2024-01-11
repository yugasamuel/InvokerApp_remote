//
//  SpellsStorage.swift
//  InvokerApp
//
//  Created by Yuga Samuel on 11/01/24.
//

import Foundation

final class SpellsStorage {
    let savePath = FileManager.getDocumentsDirectory.appendingPathComponent("SavePath")

    func loadSpells() -> [Spell] {
        do {
            let data = try Data(contentsOf: savePath)
            let spells = try JSONDecoder().decode([Spell].self, from: data)
            print("sucess")
            return spells
        } catch {
            return []
        }
    }
    
    func saveSpells(_ spells: [Spell]) {
        do {
            let data = try JSONEncoder().encode(spells)
            try data.write(to: savePath)
            print("sucess save!")
        } catch {
            print("Failed to save spells. \(error.localizedDescription)")
        }
    }
}
