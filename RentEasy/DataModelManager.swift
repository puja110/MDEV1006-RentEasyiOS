//
//  DataModelManager.swift
//  RentEasy
//
//  Created by Oladipupo Olasile on 2023-11-11.
//

import CoreData
import UIKit
import Foundation


class DataModelManager {
    static let shared = DataModelManager()
    
    init() {}
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //MARK: - SaveToggled Items
    func favoriteToggling(with rentDataEntity: RentDataEntity) {
        
        rentDataEntity.isFavorite.toggle()
        saveContext()
        print("Item saved.")
    }
    
    func saveContext() {
        do {
            try context.save()            
        } catch {
            print("Error saving: \(error)")
        }
    }

    
    
    //MARK: - LOAD ITEMS
    
    func loadItems() -> [RentDataEntity] {
        let request: NSFetchRequest<RentDataEntity> = RentDataEntity.fetchRequest()
        do {
            let fetchItems = try context.fetch(request)
            return fetchItems
        } catch {
            print("Error fetching item: \(error)")
        }
        return []
    }
    
    //MARK: - DELETING ITEMS
    func deleteItem(_ item: RentDataEntity) {
        context.delete(item)
        saveContext()
    }
    
    //MARK: - USER REGISTRATION
    func userRegistration(email: String, password: String, firstName: String, lastName: String, phoneNumber: String, context: NSManagedObjectContext) {
        
        let newUser = UserDetails(context: context)
        newUser.emailAddress = email
           newUser.password = password
           newUser.phoneNumber = phoneNumber
           newUser.firstName = firstName
           newUser.lastName = lastName
        do {
            try context.save()
            print("saved successfully")
        } catch {
            print("registration error \(error)")
        }
    }
    
    
    //MARK: - USER LOGIN
    func userLogin(emailAddress: String, password: String) -> Bool {
        let request: NSFetchRequest<UserDetails> = UserDetails.fetchRequest()
        request.predicate = NSPredicate(format: "emailAddress == %@", emailAddress)
        
        do {
            let users = try context.fetch(request)
            if let user = users.first, user.password == password {
                print("Login Successful")
                return true
            } else {
                print("Login Failed")
                return false
            }
        } catch {
            print("Unable to fetch user: \(error)")
            return false
        }
    }
}


