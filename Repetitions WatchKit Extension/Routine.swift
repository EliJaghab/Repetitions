//
//  Routines.swift
//  Repetitions WatchKit Extension
//
//  Created by Elias Jaghab on 11/14/20.
//  Copyright © 2020 Elias Jaghab. All rights reserved.
//

import Foundation

    

struct Routine {
    var routineLabel: String
    var exercise1: String
    var exercise2: String
    var exercise3: String
    var exercise4: String
    var exercise5: String

    func formatRoutine () -> String {
        return "Routine: \(routineLabel)\nExercise 1:\(exercise1)\nExercise 2:\(exercise2)\nExercise 3:\(exercise3)\nExercise 4:\(exercise4)\nExercise 5:\(exercise5)"
    }
}

