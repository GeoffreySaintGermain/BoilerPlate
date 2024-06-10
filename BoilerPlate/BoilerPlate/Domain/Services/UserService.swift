//
//  UserService.swift
//  BoilerPlate
//
//  Created by Saint Germain, Geoffrey on 21/02/2024.
//

import Foundation

protocol UserService {
    func fetchUsers() async throws -> [User]
}

class DefaultUserService: UserService {
    
    let userRepository: UserRepository = DefaultUserRepository()
    
    func fetchUsers() async throws -> [User] {
        var users: [User] = []
        let usersResponse = try await userRepository.fetchUsers()
        
        usersResponse.forEach { user in
            users.append(User(mail: user.key, id: user.value))
        }
        
        return users
    }
    
}
