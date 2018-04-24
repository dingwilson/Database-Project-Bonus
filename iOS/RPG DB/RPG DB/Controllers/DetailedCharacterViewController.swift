//
//  DetailedCharacterViewController.swift
//  RPG DB
//
//  Created by Wilson Ding on 4/21/18.
//  Copyright © 2018 Wilson Ding. All rights reserved.
//

import UIKit
import Alamofire

class DetailedCharacterViewController: UIViewController {
    
    var character : CharacterElement?
    
    var spellList : [SpellElement] = []

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var level: UILabel!
    @IBOutlet weak var race: UILabel!
    @IBOutlet weak var charClass: UILabel!
    @IBOutlet weak var sex: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var strength: UILabel!
    @IBOutlet weak var defense: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var hitpoints: UILabel!
    @IBOutlet weak var mana: UILabel!
    
    @IBOutlet weak var spellsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spellsTableView.delegate = self
        spellsTableView.dataSource = self

        guard let currentCharacter = character else {
            return
        }
        
        name.text = currentCharacter.charName
        level.text = "Lvl: \(currentCharacter.charLevel)"
        race.text = "Race: \(currentCharacter.raceID.uppercased())"
        charClass.text = "Class: \(currentCharacter.classID)"
        
        if (currentCharacter.sex) {
            sex.text = "Male"
        } else {
            sex.text = "Female"
        }
        
        weight.text = "Weight: \(currentCharacter.weight)"
        strength.text = "STR: \(currentCharacter.strength)"
        defense.text = "DEF: \(currentCharacter.defense)"
        speed.text = "Speed: \(currentCharacter.speed)"
        hitpoints.text = "HP: \(currentCharacter.hitPoints)/\(currentCharacter.hitPoints)"
        mana.text = "MP: \(currentCharacter.mana)/\(currentCharacter.mana)"
        
        switch currentCharacter.raceID {
        case "Gnomes":
            image.image = UIImage(named: "gnome")
            break
        case "Halflings":
            image.image = UIImage(named: "halfling")
            break
        case "Centaurs":
            image.image = UIImage(named: "centaur")
            break
        case "Lizard":
            image.image = UIImage(named: "lizard")
            break
        case "Goblins":
            image.image = UIImage(named: "goblin")
            break
        case "Kobolds":
            image.image = UIImage(named: "kobold")
            break
        case "Trolls":
            image.image = UIImage(named: "troll")
            break
        case "Giant":
            image.image = UIImage(named: "giant")
            break
        case "Gnolls":
            image.image = UIImage(named: "gnoll")
            break
        case "Argonian":
            image.image = UIImage(named: "argonian")
            break
        case "hobbit":
            image.image = UIImage(named: "hobbit")
            break
        default:
            break
            
        }
        
        Alamofire.request("https://database-backend-ayy-lmao.herokuapp.com/spells/class/\(Int(arc4random_uniform(11) + 1))").responseJSON { response in
            if let data = response.data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let spells = try jsonDecoder.decode(Spell.self, from: data)

                    self.spellList = spells
                    
                    DispatchQueue.main.async {
                        self.spellsTableView.reloadData()
                    }
                } catch let parseError as NSError {
                    print("JSON Error \(parseError.localizedDescription)")
                }
            }
        }
    }


    @IBAction func didPressFightButton(_ sender: Any) {
        guard let currentCharacter = character else {
            return
        }
        
        UserDefaults.standard.set(currentCharacter.defense + currentCharacter.strength, forKey: "fight")
    }
    
}

extension DetailedCharacterViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spellList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = spellList[indexPath.row].spellName
        
        return cell
    }
}
