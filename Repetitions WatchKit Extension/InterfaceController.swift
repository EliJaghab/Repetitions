//
//  InterfaceController.swift
//  Repetitions WatchKit Extension
//
//  Created by Elias Jaghab on 10/24/20.
//  Copyright © 2020 Elias Jaghab. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate {

    @IBOutlet weak var label: WKInterfaceLabel!
    @IBOutlet weak var tableView: WKInterfaceTable!
    let session = WCSession.default
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        session.delegate = self
        session.activate()

    }
    
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
        return "test"
    }
    

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {

    }
    
    var routineExercises = [String]()
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        // Assign Routine Name to Label
        if let value = message[Array(message)[0].key] as? [String] {
            self.label.setText(Array(message)[0].key)
            
            // Remove Routine Name from Exercsies
            routineExercises = Array(value.dropFirst(0))
            
            // Count Exercsies for Table Number
            tableView.setNumberOfRows(routineExercises.count, withRowType: "RowController")
            
            // Populate Table wit Exercsies
            for (index, routine) in routineExercises.enumerated() {
                if let rowController = tableView.rowController(at: index) as? RowController {
                    rowController.rowLabel.setText(routine)
                }
            }
        }
    }
    
    // Send Data to DetailInterfaceController for Next Screen
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        pushController(withName: "DetailInterfaceController", context: routineExercises[rowIndex])

    }
}
            
    

