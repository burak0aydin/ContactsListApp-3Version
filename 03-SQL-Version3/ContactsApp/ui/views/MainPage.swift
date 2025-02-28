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
    var mainPageViewModel = MainPageViewModel ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        personsTableView.delegate = self
        personsTableView.dataSource = self
        
      
        _ = mainPageViewModel.personsList.subscribe(onNext: { pList in
            self.personsList = pList
            self.personsTableView.reloadData()
        })

    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainPageViewModel.uploadPersons()
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
        mainPageViewModel.search(searchedWord: searchText)
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
                self.mainPageViewModel.delete(person_id: person.person_id!)
            }
            alert.addAction(yesAction)
            self.present(alert, animated: true)
            
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
}

