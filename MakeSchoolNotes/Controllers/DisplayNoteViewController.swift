//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import CoreData

class DisplayNoteViewController: UIViewController {
    
    @IBOutlet weak var noteTitleTextField: UITextField!
    @IBOutlet weak var noteContentTextView: UITextView!
    
    var note: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let note = self.note {
            noteTitleTextField.text = note.title
            noteContentTextView.text = note.content
        } else{
            noteTitleTextField.text = ""
            noteContentTextView.text = ""
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let listNotesTableViewController = segue.destination as! ListNotesTableViewController
        
        if let identifier = segue.identifier {
            if identifier == "save" {
            
                let note = self.note ?? CoreDataHelper.createNote()
                note.title = noteTitleTextField.text ?? ""
                note.content = noteContentTextView.text ?? ""
                note.modificationTime = Date() as NSDate
                
                CoreDataHelper.saveNote()
            }
        }
    }
    
}
