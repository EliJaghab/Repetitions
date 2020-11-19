//
//  DetailInterfaceController.swift
//  Repetitions WatchKit Extension
//
//  Created by Elias Jaghab on 11/14/20.
//  Copyright © 2020 Elias Jaghab. All rights reserved.
//

import Foundation
import WatchKit

class DetailInterfaceController: InterfaceController {
    
    @IBOutlet weak var exerciseLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Populate Exercise Name on Next Screen
        if let exercise = context as? String {
            exerciseLabel.setText(exercise)
        }
    }
    
    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
}
