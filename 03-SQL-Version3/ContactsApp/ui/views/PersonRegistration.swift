//
//  PersonRegistration.swift
//  ContactsApp
//
//  Created by Burak Aydın on 29.02.2024.
//

import UIKit

class PersonRegistration: UIViewController {
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    
    var personRegistrationviewModel = PersonRegistrationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonSave(_ sender: Any) {
        if let savedName = tfName.text , let savedPhone = tfPhone.text {
            personRegistrationviewModel.save(person_name: savedName, person_phone: savedPhone)
        }
    }
    
    
    
    
    

}
