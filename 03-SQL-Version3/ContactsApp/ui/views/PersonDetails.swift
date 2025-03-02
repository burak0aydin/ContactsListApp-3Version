//
//  PersonDetail.swift
//  ContactsApp
//
//  Created by Burak Aydın on 29.02.2024.
//

import UIKit

class PersonDetails: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    var person:Persons?
    var personDetailsviewModel = PersonDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let personClass = person {
            nameTextField.text = personClass.person_name
            phoneTextField.text = personClass.person_phone
        }
    }
    

    @IBAction func buttonUpdate(_ sender: Any) {
        if let pClass = person, let updatedName = nameTextField.text , let updatedPhone = phoneTextField.text {
            personDetailsviewModel.update(person_id: pClass.person_id!, person_name: updatedName, person_phone: updatedPhone)
        }
    }
}
