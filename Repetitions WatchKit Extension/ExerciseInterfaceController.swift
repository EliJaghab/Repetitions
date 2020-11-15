//
//  ExerciseInterfaceController.swift
//  Repetitions WatchKit Extension
//
//  Created by Elias Jaghab on 10/27/20.
//  Copyright © 2020 Elias Jaghab. All rights reserved.
//

import WatchKit
import Foundation


class ExerciseInterfaceController: WKInterfaceController {
        
    @IBOutlet weak var exerciseLabel: WKInterfaceLabel!
    @IBOutlet weak var exerciseTableView: WKInterfaceGroup!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
