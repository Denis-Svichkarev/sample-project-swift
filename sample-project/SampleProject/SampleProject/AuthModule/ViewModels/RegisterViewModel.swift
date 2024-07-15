//
//  RegisterViewModel.swift
//  SampleProject
//
//  Created by Denis Svichkarev on 14/07/24.
//

import Foundation

class RegisterViewModel {
    private let localizationService: LocalizableService
    
    init(localizationService: LocalizableService = .shared) {
        self.localizationService = localizationService
    }
    
    var screenTitle: String {
        return localizationService.localizedString(forKey: "registration_screen_title", tableName: "AuthLocalizable")
    }
    
    var usernamePlaceholder: String {
        return localizationService.localizedString(forKey: "registration_username_placeholder", tableName: "AuthLocalizable")
    }
    
    var passwordPlaceholder: String {
        return localizationService.localizedString(forKey: "registration_password_placeholder", tableName: "AuthLocalizable")
    }
    
    var confirmPasswordPlaceholder: String {
        return localizationService.localizedString(forKey: "registration_confirm_password_placeholder", tableName: "AuthLocalizable")
    }
    
    var registerButtonTitle: String {
        return localizationService.localizedString(forKey: "registration_register_button_title", tableName: "AuthLocalizable")
    }
}
