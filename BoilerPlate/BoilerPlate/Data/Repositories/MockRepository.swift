//
//  AnalyticsRepository.swift
//  BoilerPlate
//
//  Created by Saint Germain, Geoffrey on 20/02/2024.
//

import Foundation

protocol MockRepository {
    func getProfile(with id: String) async throws -> User
    func createMock(with id: Int) async throws -> String
}

final class DefaultMockRepository: MockRepository {
    
    private let networkService = DefaultNetworkService()
    
    func getProfile(with id: String) async throws -> User {
        let endpoint = ApiEndpoints.getProfile(with: id)
        return try await networkService.request(from: endpoint)
    }
    
    // MARK: POST
    
    func createMock(with id: Int) async throws -> String {
        let endpoint = ApiEndpoints.createMock(with: id)
        return try await networkService.request(from: endpoint)
    }
}
