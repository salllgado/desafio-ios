//
//  CoreDataHelper.swift
//  MyMovieDB
//
//  Created by Chrytian Salgado Pessoal on 08/06/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import UIKit
import CoreData

enum Entitys: String {
    case Movie = "Movie"
}

class CoreDataHelper {
    
    func save(in entityName: Entitys, value: String, forKey: String) throws -> Bool{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return false }
        let context = appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: entityName.rawValue, in: context) else { return false }
        let object = NSManagedObject(entity: entity, insertInto: context)
        
        object.setValue(value, forKey: forKey)
        
        //Do persistence
        do {
            try context.save()
            return true
        } catch let error as NSError {
            Logger().log(error.localizedDescription)
            return false
        }
    }
    
    func getData(in entityName: Entitys) throws -> [NSManagedObject]? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName.rawValue)
        
        do {
            return try context.fetch(fetchRequest)
        } catch let error as NSError {
            Logger().log(error.localizedDescription)
            return nil
        }
    }
}
