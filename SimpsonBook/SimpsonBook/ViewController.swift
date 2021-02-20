//
//  ViewController.swift
//  SimpsonBook
//
//  Created by yunus olgun on 4.02.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var myPersons = [Simpson]()
    var chosenSimpson : Simpson?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPersons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = myPersons[indexPath.row].name
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let kenny = Simpson(name: "kenny", job: "student1", image: UIImage(named: "kenny")!)
        let cartman = Simpson(name: "eric cartman", job: "student2", image: UIImage(named: "cartman")!)
        let kyle = Simpson(name: "kyle", job: "student3", image: UIImage(named: "kyle")!)
        let stan = Simpson(name: "stan", job: "student4", image: UIImage(named: "stan")!)
        
        myPersons.append(kenny)
        myPersons.append(cartman)
        myPersons.append(kyle)
        myPersons.append(stan)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = myPersons[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! detailsVC
            destinationVC.selectedPerson = chosenSimpson
        }
    }


}

