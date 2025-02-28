//
//  MainPageViewModel.swift
//  ContactsApp
//
//  Created by Burak Aydın on 10.03.2024.
//

import Foundation
import RxSwift

class MainPageViewModel {
    var personDaoRepo = PersonDaoRepository()
    var personsList = BehaviorSubject<[Persons]>(value: [Persons]())
    
    init() {
        personsList = personDaoRepo.personsList
        uploadPersons()
    }
    
    func delete(person_id:Int) {
        personDaoRepo.delete(person_id: person_id)
    }
    
    func search(searchedWord:String) {
        personDaoRepo.search(searchedWord: searchedWord)
    }
    
    func uploadPersons() {
        personDaoRepo.uploadPersons()
    }
    
}
