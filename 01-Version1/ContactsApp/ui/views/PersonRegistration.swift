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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonSave(_ sender: Any) {
        if let saveName = tfName.text , let savePhone = tfPhone.text {
            save(person_name: saveName, person_phone: savePhone)
        }
    }
    
    
    func save(person_name:String, person_phone:String){
        print("kişi kaydet : \(person_name) - \(person_phone)")
    }
    

}
