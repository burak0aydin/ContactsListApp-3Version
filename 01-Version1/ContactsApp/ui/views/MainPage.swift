//
//  ViewController.swift
//  ContactsApp
//
//  Created by Burak Aydın on 29.02.2024.
//

import UIKit

class MainPage: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var personsTableView: UITableView!
    var personsList = [Persons]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        personsTableView.delegate = self
        personsTableView.dataSource = self
        
        let k1 = Persons(person_id: 1, person_name: "Burak", person_phone: "11111")
        let k2 = Persons(person_id: 1, person_name: "kız", person_phone: "123213")
        let k3 = Persons(person_id: 1, person_name: "erko", person_phone: "34325")
        
        personsList.append(k1)
        personsList.append(k2)
        personsList.append(k3)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("shown to home page")
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            if let person = sender as? Persons {
                let toVC = segue.destination as! PersonDetails
                toVC.person = person
            }
        }
    }
}

extension MainPage : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("kişi Ara \(searchText)")
    }
}

extension MainPage : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = personsList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "personsTableViewCell") as! TableViewCell
        cell.personNameLabel.text = person.person_name
        cell.personPhoneLabel.text = person.person_phone
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = personsList[indexPath.row]
        performSegue(withIdentifier: "toDetails", sender: person)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete" ){_,_,_ in
            let person = self.personsList[indexPath.row]
            let alert = UIAlertController(title: "Delete Action", message: "Do you want to delete the \(person.person_name!) ?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel",  style: .cancel)
            alert.addAction(cancelAction)
            let yesAction = UIAlertAction(title: "Yes",  style: .destructive) { action in
                print ("Delete Person :\(person.person_id!)")
            }
            alert.addAction(yesAction)
            self.present(alert, animated: true)
            
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
}

