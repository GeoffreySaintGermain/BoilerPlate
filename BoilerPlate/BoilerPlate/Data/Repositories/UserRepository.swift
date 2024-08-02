//
//  UserRepository.swift
//  BoilerPlate
//
//  Created by Saint Germain, Geoffrey on 20/02/2024.
//

import Foundation

protocol UserRepository {
    func fetchUsers() async throws -> [String: String]
}

final class DefaultUserRepository: UserRepository {
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService = DefaultDIContainer.shared.resolve(type: NetworkService.self)) {
        self.networkService = networkService
    }

    func fetchUsers() async throws -> [String: String] {
        let endpoint = ApiEndpoints.getProfile(with: "")
        return try await networkService.request(from: endpoint)
    }
}
