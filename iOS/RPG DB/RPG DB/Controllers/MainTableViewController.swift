//
//  MainTableViewController.swift
//  RPG DB
//
//  Created by Wilson Ding on 4/21/18.
//  Copyright © 2018 Wilson Ding. All rights reserved.
//

import UIKit
import Alamofire

class MainTableViewController: UITableViewController {
    
    var characterList : [CharacterElement] = []
    
    var selectedCharacter = -1;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("https://database-backend-ayy-lmao.herokuapp.com/characters").responseJSON { response in
            if let data = response.data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let charList = try jsonDecoder.decode(Character.self, from: data)
                    
                    self.characterList = charList

                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch let parseError as NSError {
                    print("JSON Error \(parseError.localizedDescription)")
                }
            }
        }
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.blue
        
        self.tableView.rowHeight = 70
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CharacterTableViewCell
        
        cell.charName?.text = characterList[indexPath.row].charName
        cell.charRace?.text = "\(characterList[indexPath.row].raceID.uppercased()): \(characterList[indexPath.row].classID)"
        
        switch characterList[indexPath.row].raceID {
        case "Gnomes":
            cell.charPicture?.image = UIImage(named: "gnome")
            break
        case "Halflings":
            cell.charPicture?.image = UIImage(named: "halfling")
            break
        case "Centaurs":
            cell.charPicture?.image = UIImage(named: "centaur")
            break
        case "Lizard":
            cell.charPicture?.image = UIImage(named: "lizard")
            break
        case "Goblins":
            cell.charPicture?.image = UIImage(named: "goblin")
            break
        case "Kobolds":
            cell.charPicture?.image = UIImage(named: "kobold")
            break
        case "Trolls":
            cell.charPicture?.image = UIImage(named: "troll")
            break
        case "Giant":
            cell.charPicture?.image = UIImage(named: "giant")
            break
        case "Gnolls":
            cell.charPicture?.image = UIImage(named: "gnoll")
            break
        case "Argonian":
            cell.charPicture?.image = UIImage(named: "argonian")
            break
        case "hobbit":
            cell.charPicture?.image = UIImage(named: "hobbit")
            break
        default:
            break
            
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let fightValue = UserDefaults.standard.double(forKey: "fight")
        
        if (fightValue != -1.0) {
            let currentCharacterFightValue = characterList[indexPath.row].strength + characterList[indexPath.row].defense
            
            if currentCharacterFightValue > fightValue {
                cell.backgroundColor = UIColor.red
            } else if currentCharacterFightValue < fightValue {
                cell.backgroundColor = UIColor.green
            } else {
                cell.backgroundColor = UIColor.clear
            }
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCharacter = indexPath.row
        performSegue(withIdentifier: "segueToDetail", sender: self)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? DetailedCharacterViewController {
            detailVC.character = self.characterList[selectedCharacter]
        }
    }

}
