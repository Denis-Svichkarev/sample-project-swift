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
        return localizationService.localizedString(forKey: "registration_screen_title")
    }
    
    var usernamePlaceholder: String {
        return localizationService.localizedString(forKey: "registration_username_placeholder")
    }
    
    var passwordPlaceholder: String {
        return localizationService.localizedString(forKey: "registration_password_placeholder")
    }
    
    var confirmPasswordPlaceholder: String {
        return localizationService.localizedString(forKey: "registration_confirm_password_placeholder")
    }
    
    var registerButtonTitle: String {
        return localizationService.localizedString(forKey: "registration_register_button_title")
    }
}
