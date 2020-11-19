//
//  ViewController.swift
//  Repetitions
//
//  Created by Elias Jaghab on 10/24/20.
//  Copyright © 2020 Elias Jaghab. All rights reserved.
//
import UIKit
import WatchConnectivity

class ViewController: UIViewController, UITextFieldDelegate, WCSessionDelegate {
    
    var session: WCSession?
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var routineField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        routineField.delegate = self
        createWCSession()
    }
    
    func createWCSession() {
      if WCSession.isSupported() {
        session = WCSession.default
        session?.delegate = self
        session?.activate()
      }
    }

    @IBAction func enterTapped(_ sender: Any) {
        var items = [String]()
        items = routineField.text!.components(separatedBy: ",") // Translate User Input to Array
        let exercises = Array(items.dropFirst(1)) // Separate Routine Name from Exercsies
        
        let currRoutine = Routine(routineLabel: items[0], exerciseArray: exercises) // Create Routine Struct with Routine Label and Exercises
 
        textView.text = currRoutine.formatRoutine() // Populate Text Box to Confirm User Input
        
        let routineDict = currRoutine.toDictionary() // Convert Routine Struct to Dictionary so it can be Passed to Phone
        // Send Routine to Watch
        if let validSession = self.session, validSession.isReachable {
            validSession.sendMessage(routineDict, replyHandler: nil, errorHandler: nil)
        
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
      }
    
      func sessionDidBecomeInactive(_ session: WCSession) {
      }
      
      func sessionDidDeactivate(_ session: WCSession) {
      }
      
      func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
      }
      
    }
