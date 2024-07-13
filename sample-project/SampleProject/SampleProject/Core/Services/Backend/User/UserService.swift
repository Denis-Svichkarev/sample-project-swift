//
//  UserService.swift
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
    func editUser(_ user: User, completion: @escaping (Bool) -> Void)
}

protocol UserClearService {
    func clearUser()
}

typealias UserService = UserFetchingService & UserSavingService & UserClearService
