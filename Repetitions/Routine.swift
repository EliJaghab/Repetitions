//
//  Routine.swift
//  Repetitions
//
//  Created by Elias Jaghab on 11/15/20.
//  Copyright © 2020 Elias Jaghab. All rights reserved.
//

import Foundation

struct Routine {
    var routineLabel: String
    var exercises: [String]
    
    func formatRoutine () -> String {
        var exercisesFormatted = ""
        for (var index, exercise) in exercises.enumerated() {
            index += 1
            exercisesFormatted.append("\nExercise \(index): \(exercise)")
        }

        return "Routine: \(routineLabel)\nExercises:\(exercisesFormatted)"
        //return "Routine: \(routineLabel)\nExercises:\(exercises))"
    }
    
    init(routineLabel: String, exerciseArray: [String]) {
            self.routineLabel = routineLabel
            self.exercises = exerciseArray
    }

    func toDictionary() -> [String:[String]] {
        let dict = [self.routineLabel: exercises]
        
        return dict
    }
}
