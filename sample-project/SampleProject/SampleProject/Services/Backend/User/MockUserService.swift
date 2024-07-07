//
//  CoreDataTaskService.swift
//  SampleProject
//
//  Created by Denis Svichkarev on 06/07/24.
//

import Foundation

class MockUserService: UserService {
    func fetchCurrentUser(completion: @escaping (User?) -> Void) {
        let delay = DispatchTime.now() + 3.0
        
        DispatchQueue.main.asyncAfter(deadline: delay) {
            let user = User(id: "1", username: "John", password: "secret123")
//            completion(user)
            completion(nil)
        }
    }

    func saveUser(_ user: User, completion: @escaping (Bool) -> Void) {
        let delay = DispatchTime.now() + 3.0
        
        DispatchQueue.main.asyncAfter(deadline: delay) {
            completion(true)
//            completion(false)
        }
    }
    
    func editUser(_ user: User, completion: @escaping (Bool) -> Void) {
        let delay = DispatchTime.now() + 3.0
        DispatchQueue.main.asyncAfter(deadline: delay) {
            completion(true)
//            completion(false)
        }
    }
    
    func clearUser() {
        // Mock clear user implementation
    }
}
