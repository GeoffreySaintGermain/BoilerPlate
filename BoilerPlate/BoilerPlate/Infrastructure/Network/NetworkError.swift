//
//  NetworkError.swift
//  BoilerPlate
//
//  Created by Saint Germain, Geoffrey on 16/02/2024.
//

import Foundation

enum NetworkError: Error {
    case error(statusCode: Int, message: String?)
    case malformedURL
    case malformedQuerry
}
