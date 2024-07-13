//
//  AuthViewModel.swift
//  SampleProject
//
//  Created by Denis Svichkarev on 29/06/24.
//

import Combine

class UserViewModel {
    private let userService: UserService
    
    @Published var user: User? = nil
    @Published var inputError: Bool = false
       
    private var cancellables = Set<AnyCancellable>()

    var userDidChange: ((User?) -> Void)?

    init(userService: UserService) {
        self.userService = userService
    }

    func fetchCurrentUser() {
        userService.fetchCurrentUser { [weak self] user in
            self?.user = user
        }
    }

    func saveUser(username: String?, password: String?) {
        guard let username = username, !username.isEmpty,
                let password = password, !password.isEmpty else {
            inputError = true
            return
        }
        
        inputError = false
        
        let user = User(username: username, password: password)
        userService.saveUser(user) { [weak self] success in
            if success {
                self?.user = user
            } else {
                self?.user = nil
            }
        }
    }

    func clearUser() {
        userService.clearUser()
        user = nil
    }
    
    deinit {
        cancellables.forEach { $0.cancel() }
    }
}
