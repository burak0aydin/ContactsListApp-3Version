//
//  PersonDetailsViewModel.swift
//  ContactsApp
//
//  Created by Burak Aydın on 10.03.2024.
//

import Foundation

class PersonDetailsViewModel {
    var personDaoRepo = PersonDaoRepository()
    
    func update(person_id:Int, person_name:String, person_phone:String){
        personDaoRepo.update(person_id: person_id, person_name: person_name, person_phone: person_phone)
    }
    
    
}
