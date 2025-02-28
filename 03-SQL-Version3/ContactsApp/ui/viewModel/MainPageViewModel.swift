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
        databaseCopy()
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
    
    func databaseCopy(){
        let bundlePath = Bundle.main.path(forResource: "contacts", ofType: ".sqlite")
        let targetRoad = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyLocation = URL(fileURLWithPath: targetRoad).appendingPathComponent("contacts.sqlite")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: copyLocation.path){
            print("Database already exists")
        }else{
            do{
                try fileManager.copyItem(atPath: bundlePath!, toPath: copyLocation.path)
            }catch{}
        }
    }
}
