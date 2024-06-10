//
//  DomainError.swift
//  BoilerPlate
//
//  Created by Saint Germain, Geoffrey on 27/02/2024.
//

enum DomainError: Error {
    case emptyBody
    
    var description: String {
        switch self {
        case .emptyBody:
            "data are empty"
        }
    }
    
    var errorDescription: String? {
        get {
            description
        }
    }
}
