//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 22/03/21.
//

import Foundation

final class MoodNumbersAnalyzer {
    private let magnitude: Double
    private let score: Double
    
    init(magnitude: Double, score: Double) {
        self.magnitude = magnitude
        self.score = score
    }

    func analyze() -> String {
        switch score {
        case 0.5...1:
            return "Feliz 😁"
        case 0.1...0.4:
            return "Neutro 😐"
        case (-1.0)...0.0:
            return "Triste ☹️"
        default:
            return "Neutro 😐"
        }
    }
}
