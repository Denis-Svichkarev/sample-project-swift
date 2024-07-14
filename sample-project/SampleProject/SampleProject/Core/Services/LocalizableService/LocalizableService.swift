//
//  LocalizableService.swift
//  SampleProject
//
//  Created by Denis Svichkarev on 14/07/24.
//

import Foundation

class LocalizableService {
    static let shared = LocalizableService()
    
    private init() {}
    
    func localizedString(forKey key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
}
