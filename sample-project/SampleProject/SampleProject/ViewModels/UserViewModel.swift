//
//  AuthViewModel.swift
//  SampleProject
//
//  Created by Denis Svichkarev on 29/06/24.
//

protocol UserViewModelDelegate: AnyObject {
    func didAuthenticateUser()
    func didFailToAuthenticateUser()
    func didFailInput()
}

class UserViewModel {
    private let userService: UserService
    
    weak var delegate: UserViewModelDelegate?

    var user: User? {
        didSet {
            self.userDidChange?(user)
            if user != nil {
                self.delegate?.didAuthenticateUser()
            } else {
                self.delegate?.didFailToAuthenticateUser()
            }
        }
    }

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
        guard let username = username, username != "", let password = password, password != "" else {
            delegate?.didFailInput()
            return
        }
        
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
