//
//  AuthViewModel.swift
//  SampleProject
//
//  Created by Denis Svichkarev on 29/06/24.
//

import Combine

class UserViewModel {
    private let userService: UserService
    private var cancellables = Set<AnyCancellable>()

    @Published var user: User? = nil
    var userDidChange: ((User?) -> Void)?

    init(userService: UserService) {
        self.userService = userService
    }

    func fetchCurrentUser() {
        userService.fetchCurrentUser { [weak self] user in
            self?.user = user
        }
    }

    func saveUser(username: String, password: String) {
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
}
