//
//  PersonDaoRepository.swift
//  ContactsApp
//
//  Created by Burak Aydın on 10.03.2024.
//

import Foundation
import RxSwift

class PersonDaoRepository {
    var personsList = BehaviorSubject<[Persons]>(value: [Persons]())
    
    func save(person_name:String, person_phone:String){
        print("kişi kaydet : \(person_name) - \(person_phone)")
    }
    
    func update(person_id:Int, person_name:String, person_phone:String){
        print("kişi kaydet :  \(person_id) - \(person_name) - \(person_phone)")
    }
    
    func delete(person_id:Int) {
        print ("Delete Person :\(person_id)")
        uploadPersons()
    }
    
    func search(searchedWord:String) {
        print("Search Person : \(searchedWord)")
    }
    
    func uploadPersons() {
        var pList = [Persons] ()
        let k1 = Persons(person_id: 1, person_name: "Burak", person_phone: "11111")
        let k2 = Persons(person_id: 1, person_name: "kız", person_phone: "123213")
        let k3 = Persons(person_id: 1, person_name: "erko", person_phone: "34325")
        pList.append(k1)
        pList.append(k2)
        pList.append(k3)
        personsList.onNext(pList)
    }
    
}
