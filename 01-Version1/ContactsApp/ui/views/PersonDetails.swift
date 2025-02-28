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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let personClass = person {
            nameTextField.text = personClass.person_name
            phoneTextField.text = personClass.person_phone
        }
    }
    

    @IBAction func buttonUpdate(_ sender: Any) {
        if let pClass = person, let updateName = nameTextField.text , let updatePhone = phoneTextField.text {
            update(person_id: pClass.person_id!, person_name: updateName, person_phone: updatePhone)
        }
    }
    
    func update(person_id:Int, person_name:String, person_phone:String){
        print("kişi kaydet :  \(person_id) - \(person_name) - \(person_phone)")
    }
    
}
