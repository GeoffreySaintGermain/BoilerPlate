//
//  UserDefaultsStorage.swift
//  BoilerPlate
//
//  Created by Saint Germain, Geoffrey on 21/02/2024.
//

import Foundation

class UserDefaultsStorage {

    static func fetchData<D: Decodable>(forKey key: UserDefaultsKey) throws -> D {
        guard let codedUser = UserDefaults.standard.data(forKey: key.rawValue) else {
            throw UserDefaultsStorageError.valueNotFound
        }
        return try JSONDecoder().decode(D.self, from: codedUser)
    }
    
    static func saveData<D: Codable>(_ value: D, forKey key: UserDefaultsKey) throws {
        let encodedUser = try JSONEncoder().encode(value)
        UserDefaults.standard.set(encodedUser, forKey: key.rawValue)
    }
}
