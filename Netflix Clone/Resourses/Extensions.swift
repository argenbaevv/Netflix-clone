//
//  Extensions.swift
//  Netflix Clone
//
//  Created by argenbaev on 2/21/23.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
