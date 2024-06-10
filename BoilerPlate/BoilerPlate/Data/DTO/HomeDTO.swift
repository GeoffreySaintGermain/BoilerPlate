//
//  HomeDTO.swift
//  BoilerPlate
//
//  Created by Saint Germain, Geoffrey on 07/03/2024.
//

struct HomeDTO: Codable {
    let address: String?
    let lat: Double?
    let lng: Double?
    let departure: Double?
    let arrival: Double?
    let duration: Double?
}
