//
//  Spell.swift
//  InvokerApp
//
//  Created by Yuga Samuel on 10/01/24.
//

import Foundation

struct Spell: Identifiable {
    var id = UUID()
    let elements: [Element]
    
    var spellName: String {
        let countedSet = NSCountedSet(array: elements)
        return Spell.combinationName[countedSet] ?? "Sun Strike"
    }
    var elementsAbbreviation: String {
        return elements.map { String($0.rawValue.first!) }.joined()
    }
}

extension Spell {
    enum Element: String {
        case Quas
        case Wex
        case Exort
    }
    
    static var sampleData = [
        Spell(elements: [.Quas, .Quas, .Quas]),
        Spell(elements: [.Wex, .Wex, .Wex]),
        Spell(elements: [.Exort, .Exort, .Exort]),
    ]
    
    static let combinationName: [NSCountedSet: String] = [
        NSCountedSet(array: [Element.Quas, Element.Quas, Element.Quas]): "Cold Snap",
        NSCountedSet(array: [Element.Quas, Element.Quas, Element.Wex]): "Ghost Walk",
        NSCountedSet(array: [Element.Quas, Element.Quas, Element.Exort]): "Ice Wall",
        NSCountedSet(array: [Element.Wex, Element.Wex, Element.Wex]): "E.M.P.",
        NSCountedSet(array: [Element.Wex, Element.Wex, Element.Quas]): "Tornado",
        NSCountedSet(array: [Element.Wex, Element.Wex, Element.Exort]): "Alacrity",
        NSCountedSet(array: [Element.Exort, Element.Exort, Element.Exort]): "Sun Strike",
        NSCountedSet(array: [Element.Exort, Element.Exort, Element.Wex]): "Chaos Meteor",
        NSCountedSet(array: [Element.Exort, Element.Exort, Element.Quas]): "Forge Spirit",
        NSCountedSet(array: [Element.Quas, Element.Wex, Element.Exort]): "Deafening Blast"
    ]
}

extension [Spell] {
    func indexOfSpell(withId id: Spell.ID) -> Self.Index {
        guard let index = firstIndex(where: { $0.id == id }) else { fatalError() }
        return index
    }
}
