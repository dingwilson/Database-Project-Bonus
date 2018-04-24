//
//  Character.swift
//  RPG DB
//
//  Created by Wilson Ding on 4/21/18.
//  Copyright © 2018 Wilson Ding. All rights reserved.
//

import Foundation

typealias Character = [CharacterElement]

class CharacterElement: Codable {
    let charID: Int
    let charName: String
    let charLevel: Int
    let strength, defense: Double
    let sex: Bool
    let weight: Int
    let raceID, classID: String
    let mana, hitPoints: Int
    let speed: Double
    
    enum CodingKeys: String, CodingKey {
        case charID = "char_id"
        case charName = "char_name"
        case charLevel = "char_level"
        case strength, defense, sex, weight
        case raceID = "race_id"
        case classID = "class_id"
        case mana
        case hitPoints = "hit_points"
        case speed
    }
}

