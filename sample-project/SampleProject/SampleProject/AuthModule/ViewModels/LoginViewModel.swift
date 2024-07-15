//
//  AuthViewModel.swift
//  SampleProject
//
//  Created by Denis Svichkarev on 14/07/24.
//

import Foundation

class LoginViewModel {
    private let localizationService: LocalizableService
    
    init(localizationService: LocalizableService = .shared) {
        self.localizationService = localizationService
    }
    
    var screenTitle: String {
        return localizationService.localizedString(forKey: "login_screen_title", tableName: "AuthLocalizable")
    }
    
    var usernamePlaceholder: String {
        return localizationService.localizedString(forKey: "login_username_placeholder", tableName: "AuthLocalizable")
    }
    
    var passwordPlaceholder: String {
        return localizationService.localizedString(forKey: "login_password_placeholder", tableName: "AuthLocalizable")
    }
    
    var loginButtonTitle: String {
        return localizationService.localizedString(forKey: "login_button_title", tableName: "AuthLocalizable")
    }
    
    var registerButtonTitle: String {
        return localizationService.localizedString(forKey: "register_button_title", tableName: "AuthLocalizable")
    }
}
