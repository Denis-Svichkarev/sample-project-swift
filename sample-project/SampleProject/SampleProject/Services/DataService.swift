//
//  DataService.swift
//  SampleProject
//
//  Created by Denis Svichkarev on 29/06/24.
//

import Foundation

protocol UserFetchingService {
    func fetchCurrentUser(completion: @escaping (User?) -> Void)
}

protocol UserSavingService {
    func saveUser(_ user: User, completion: @escaping (Bool) -> Void)
}

protocol UserClearService {
    func clearUser()
}

typealias UserService = UserFetchingService & UserSavingService & UserClearService


class FirebaseDataService: UserService {
    func fetchCurrentUser(completion: @escaping (User?) -> Void) {
        // Could be a real implementation
    }

    func saveUser(_ task: User, completion: @escaping (Bool) -> Void) {
        // Could be a real implementation
    }
    
    func clearUser() {
        // Could be a real implementation
    }
}

class CoreDataTaskService: UserService {
    func fetchCurrentUser(completion: @escaping (User?) -> Void) {
        let delay = DispatchTime.now() + 3.0
        
        DispatchQueue.main.asyncAfter(deadline: delay) {
//            let user = User(username: "John", password: "secret123")
//            completion(user)
            
            completion(nil)
        }
    }

    func saveUser(_ task: User, completion: @escaping (Bool) -> Void) {
        let delay = DispatchTime.now() + 3.0
        
        DispatchQueue.main.asyncAfter(deadline: delay) {
            completion(true)
            
//            completion(false)
        }
    }
    
    func clearUser() {
        
    }
}
