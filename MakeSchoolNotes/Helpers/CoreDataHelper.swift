//
//  CoreDataHelper.swift
//  MakeSchoolNotes
//
//  Created by Fernando on 6/22/17.
//  Copyright © 2017 MakeSchool. All rights reserved.
//

import UIKit
import CoreData

class CoreDataHelper {
    static let appDelegate =  UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    
    static func createNote() -> Note {
        let note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: managedContext) as! Note
        
        return note
    }
    
    static func saveNote() {
        do {
            try managedContext.save()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    static func deleteNote(note: Note) {
        managedContext.delete(note)
        saveNote()
    }
    
    static func retrieveAllNotes() -> [Note] {
        let fetchRequest = NSFetchRequest<Note>(entityName: "Note")
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results
        } catch let err as NSError {
            print("Couldn't fetch all notes \(err)")
        }
        
        return []
        
    }
}
