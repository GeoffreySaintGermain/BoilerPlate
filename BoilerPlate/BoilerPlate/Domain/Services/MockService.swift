//
//  MockService.swift
//  BoilerPlate
//
//  Created by Saint Germain, Geoffrey on 23/02/2024.
//

protocol MockService {
    @discardableResult
    func fetchUser(_ id: String) async throws -> User
}

class DefaultMockService: MockService {
    
    let analyticsRepository: MockRepository = DefaultMockRepository()
    
    @discardableResult
    func fetchUser(_ id: String) async throws -> User {
        return try await analyticsRepository.getProfile(with: id)
    }
}
