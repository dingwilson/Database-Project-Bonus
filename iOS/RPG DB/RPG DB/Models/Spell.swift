//
//  Spell.swift
//  RPG DB
//
//  Created by Wilson on 4/24/18.
//  Copyright © 2018 Wilson Ding. All rights reserved.
//

import Foundation

typealias Spell = [SpellElement]

struct SpellElement: Codable {
    let spellID: Int
    let spellName: String
    let spellLevel, duration: Int
    let strengthM, defenseM, speedM: Double
    let raceID, classID, manaCost: Int
    
    enum CodingKeys: String, CodingKey {
        case spellID = "spell_id"
        case spellName = "spell_name"
        case spellLevel = "spell_level"
        case duration
        case strengthM = "strength_m"
        case defenseM = "defense_m"
        case speedM = "speed_m"
        case raceID = "race_id"
        case classID = "class_id"
        case manaCost = "mana_cost"
    }
}

