//
//  Spell.swift
//  InvokerApp
//
//  Created by Yuga Samuel on 10/01/24.
//

import UIKit

struct Spell: Identifiable {
    var id = UUID()
    let elements: [Element]
    
    var spellName: String {
        let countedSet = NSCountedSet(array: elements)
        return Spell.combinationName[countedSet] ?? "Sun Strike"
    }
    var elementsJoined: NSAttributedString {
        let joinedString = elements.map { String($0.rawValue) }.joined(separator: " ")
        
        let attributedString = NSMutableAttributedString(string: joinedString)
        
        var currentIndex = joinedString.startIndex
        
        for element in elements {
            if let range = joinedString.range(of: String(element.rawValue), range: currentIndex..<joinedString.endIndex) {
                let start = joinedString.distance(from: joinedString.startIndex, to: range.lowerBound)
                let end = joinedString.distance(from: joinedString.startIndex, to: range.upperBound)
                let color = element == .Quas ? UIColor(resource: .invokerQuas) : element == .Wex ? UIColor(resource: .invokerWex) : UIColor(resource: .invokerExort)
                attributedString.addAttribute(.foregroundColor, value: color, range: NSRange(location: start, length: end - start))
                currentIndex = range.upperBound
            }
        }
        
        return attributedString
    }
}

extension Spell {
    enum Element: String {
        case Quas
        case Wex
        case Exort
        case None
    }
    
    static var sampleData = [
        Spell(elements: [.Quas, .Quas, .Quas]),
        Spell(elements: [.Quas, .Quas, .Wex]),
        Spell(elements: [.Quas, .Quas, .Exort]),
        Spell(elements: [.Wex, .Wex, .Wex]),
        Spell(elements: [.Wex, .Wex, .Quas]),
        Spell(elements: [.Wex, .Wex, .Exort]),
        Spell(elements: [.Exort, .Exort, .Exort]),
        Spell(elements: [.Exort, .Exort, .Wex]),
        Spell(elements: [.Exort, .Exort, .Quas]),
        Spell(elements: [.Quas, .Wex, .Exort]),
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
