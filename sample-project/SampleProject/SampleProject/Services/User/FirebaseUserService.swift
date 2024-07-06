//
//  DataService.swift
//  SampleProject
//
//  Created by Denis Svichkarev on 06/07/24.
//

import Foundation

class FirebaseUserService: UserService {
    func fetchCurrentUser(completion: @escaping (User?) -> Void) {
        // Firebase-specific implementation
    }

    func saveUser(_ user: User, completion: @escaping (Bool) -> Void) {
        // Firebase-specific implementation
    }
    
    func editUser(_ user: User, completion: @escaping (Bool) -> Void) {
        // Firebase-specific implementation
    }
    
    func clearUser() {
        // Firebase-specific implementation
    }
}
