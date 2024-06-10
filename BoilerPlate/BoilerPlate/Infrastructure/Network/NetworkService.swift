//
//  NetworkService.swift
//  BoilerPlate
//
//  Created by Saint Germain, Geoffrey on 16/02/2024.
//

import Foundation

protocol NetworkService {
    func request<D: Decodable>(from endpoint: Endpoint) async throws -> D
}

final class DefaultNetworkService: NetworkService {
    
    typealias NetworkResponse = (data: Data, response: URLResponse)
        
    private let session = URLSession.shared
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private let logger = DefaultNetworkErrorLogger()
    
    func request<D: Decodable>(from endpoint: Endpoint) async throws -> D {
        let request = try endpoint.createRequest()
        logger.log(request: request)
        let response = try await sendRequest(request: request)
        logger.log(responseData: response.data, response: response.response)
        return try decoder.decode(D.self, from: response.data)
    }
    
    private func sendRequest(request: URLRequest) async throws -> NetworkResponse {
        do {
            return try await session.data(for: request)
        } catch let error as NSError {
            var message: String? = nil
            if let data = error.userInfo["data"] as? Data {
                message = try? decoder.decode(String.self, from: data)
            }
            throw NetworkError.error(statusCode: error.code, message: message)
        }
    }
}
