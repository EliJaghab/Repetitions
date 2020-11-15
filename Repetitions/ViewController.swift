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
        self.configureWatchKitSession()
        // Do any additional setup after loading the view.
    }
    
    func configureWatchKitSession() {
      
      if WCSession.isSupported() {
        session = WCSession.default
        session?.delegate = self
        session?.activate()
      }
    }
    
    @IBAction func tapSendDataToWatch(_ sender: Any) {
        if let validSession = self.session, validSession.isReachable {//5.1
            let data: [String: Any] = ["iPhone": "1Data from iPhone" as Any] // Create your Dictionay as per uses
            validSession.sendMessage(data, replyHandler: nil, errorHandler: nil)
          }
        }


    @IBAction func enterTapped(_ sender: Any) {
        var items = ["Routine Placeholder", "Ex 1", "Ex 2", "Ex 3", "Ex 4", "Ex 5"]
        items = routineField.text!.components(separatedBy: ",")
        
        let routine = items[0]
        let ex1 = items[1]
        let ex2 = items[2]
        let ex3 = items[3]
        let ex4 = items[4]
        let ex5 = items[5]
        textView.text = "Routine: \(routine)\nExercise 1:\(ex1)\nExercise 2:\(ex2)\nExercise 3:\(ex3)\nExercise 4:\(ex4)\nExercise 5:\(ex5)"
        
        if let validSession = self.session, validSession.isReachable {//5.1
            let data: [String: Any] = ["iPhone": (items) as Any] // Create your Dictionay as per uses
            validSession.sendMessage(data, replyHandler: nil, errorHandler: nil)
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
      
      func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("received message: \(message)")
        DispatchQueue.main.async { //6
          if let value = message["watch"] as? String {
            self.label.text = value
          }
        }
      }
    }

