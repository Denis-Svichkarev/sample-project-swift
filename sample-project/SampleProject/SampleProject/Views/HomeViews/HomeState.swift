//
//  HomeState.swift
//  SampleProject
//
//  Created by Denis Svichkarev on 06/07/24.
//

import Foundation

enum HomeState {
    case stateA
    case stateB
    
    mutating func toggle() {
        switch self {
        case .stateA:
            self = .stateB
        case .stateB:
            self = .stateA
        }
    }
}
