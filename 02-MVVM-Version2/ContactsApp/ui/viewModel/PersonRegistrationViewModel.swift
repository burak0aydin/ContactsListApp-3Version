//
//  PersonRegistrationViewModel.swift
//  ContactsApp
//
//  Created by Burak Aydın on 10.03.2024.
//

import Foundation

class PersonRegistrationViewModel {
    var personDaoRepo = PersonDaoRepository()
    
    func save(person_name:String, person_phone:String){
        personDaoRepo.save(person_name: person_name, person_phone: person_phone)
    }
}
