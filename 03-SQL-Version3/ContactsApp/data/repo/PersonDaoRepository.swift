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
    let db:FMDatabase?
    
    init(){
        let targetRoad = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: targetRoad).appendingPathComponent("contacts.sqlite")
        db = FMDatabase(path: databaseURL.path)
    }
    
    func save(person_name:String, person_phone:String){
        db?.open()
        do {
            try db!.executeUpdate("INSERT INTO Persons (person_name, person_tel) VALUES (?,?)", values: [person_name, person_phone])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func update(person_id:Int, person_name:String, person_phone:String){
        db?.open()
        do {
            try db!.executeUpdate("UPDATE Persons SET person_name = ?, person_tel = ? WHERE person_id = ?", values: [person_name, person_phone, person_id])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func delete(person_id:Int) {
        db?.open()
        do {
            try db!.executeUpdate("DELETE FROM Persons WHERE person_id = ?", values: [person_id])
            uploadPersons()
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func search(searchedWord:String) {
        db?.open()
        var pList = [Persons] ()
        do {
            let rs = try db!.executeQuery("SELECT * FROM Persons WHERE person_name like '%\(searchedWord)%' OR person_tel like '%\(searchedWord)%' ", values: nil)
            while rs.next() {
                let person = Persons(
                    person_id: Int(rs.string(forColumn: "person_id"))!,
                    person_name: rs.string(forColumn: "person_name")!,
                    person_phone: rs.string(forColumn: "person_tel")!)
                pList.append(person)
            }
            personsList.onNext(pList)
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    //Even if the database coming from SQL is int, it will come as a string.
    func uploadPersons() {
        db?.open()
        var pList = [Persons] ()
        do {
            let rs = try db!.executeQuery("SELECT * FROM Persons", values: nil)
            while rs.next() {
                let person = Persons(
                    person_id: Int(rs.string(forColumn: "person_id"))!,
                    person_name: rs.string(forColumn: "person_name")!,
                    person_phone: rs.string(forColumn: "person_tel")!)
                pList.append(person)
            }
            personsList.onNext(pList)
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
}
