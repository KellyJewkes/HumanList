//
//  HumanTableViewController.swift
//  HumanList
//
//  Created by Kelly Jewkes on 3/2/18.
//  Copyright © 2018 LightWing. All rights reserved.
//

import UIKit

class HumanTableViewController: UITableViewController {
    override func viewDidLoad() {
        super .viewDidLoad()
    }
   
    @IBAction func addButtonTapped(_ sender: Any) {
        addHumanAlert()
        tableView.reloadData()
    }
    
    @IBAction func randomizeButtonTapped(_ sender: Any) {
       newArray.shuffle()
        self.tableView.reloadData()
    }
    
    var newArray = HumanController.shared.humans
    
    func addHumanAlert() {
        let alertController = UIAlertController(title: "Add Human", message: "Please add a Human.", preferredStyle: .alert)
        
        //textfild
        alertController.addTextField { (textField) in
            textField.placeholder = "add Human..."
        }
        //save textfield
        let addHuman = UIAlertAction(title: "Save", style: .default, handler: {(action: UIAlertAction) -> Void in
            let humanName = alertController.textFields?.first
            guard let humanNameAsString = humanName?.text else {return}
            HumanController.shared.add(humanWith: humanNameAsString)
            self.tableView.reloadData()
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(addHuman)
        alertController.addAction(cancel)
        
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
//        override func numberOfSections(in tableView: UITableView) -> Int {
//            return HumanController.shared.sections.count
//        }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return HumanController.shared.sections[section]
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HumanController.shared.humans.count
        //return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HumanCell", for: indexPath)
        let human =
            //newArray[indexPath.row] ??
            HumanController.shared.humans[indexPath.row]
        cell.textLabel?.text = human.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let rowToDelete =
               // newArray[indexPath.row] ??
                    HumanController.shared.humans[indexPath.row]
            HumanController.shared.delete(humanWith: rowToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
extension Array {
    mutating func shuffle() {
        for i in 0..<(count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            swapAt(i, j)
        }
    }
}
