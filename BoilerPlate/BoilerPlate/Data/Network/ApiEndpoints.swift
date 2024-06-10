//
//  ApiEndpoints.swift
//  BoilerPlate
//
//  Created by Saint Germain, Geoffrey on 16/02/2024.
//

import Foundation

struct ApiEndpoints {
    
    // MARK: GET
    
    static func getProfile(with id: String) -> Endpoint {
        return Endpoint(
            path: "/api/mock",
            method: .get,
            bodyParametersEncodable: id
        )
    }
    
    // MARK: POST
    
    static func createMock(with id: Int) -> Endpoint {
        return Endpoint(
            path: "/api/mock/",
            method: .post,
            bodyParametersEncodable: id)
    }
    
    // MARK: PATCH
    
    static func updateMock(id: String, home: HomeDTO) -> Endpoint {
        return Endpoint(
            path: "/api/mock",
            method: .patch,
            bodyParametersEncodable: home
        )
    }
}
