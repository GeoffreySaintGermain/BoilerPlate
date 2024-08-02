//
//  DIContainer.swift
//  BoilerPlate
//
//  Created by Saint Germain, Geoffrey on 02/08/2024.
//

import Foundation

protocol DIContainer {
    func register<Service>(type: Service.Type, service: Any)
    func resolve<Service>(type: Service.Type) -> Service
}

final class DefaultDIContainer: DIContainer {
    
    static let shared = DefaultDIContainer()
    
    private var services: [String: Any] = [:]
    
    private init() {
        registerViewModels()
        registerServices()
        registerRepositories()
        registerNetwork()
    }
    
    // MARK: Register classes
    
    private func registerViewModels() {
        // No ViewModels in this app
    }
    
    private func registerServices() {
        register(type: MockService.self, service: DefaultMockService())
        register(type: UserService.self, service: DefaultUserService())
    }

    private func registerRepositories() {
        register(type: MockRepository.self, service: DefaultMockService())
        register(type: UserRepository.self, service: DefaultUserRepository())
    }
    
    private func registerNetwork() {
        register(type: NetworkLogger.self, service: DefaultNetworkLogger())
        register(type: NetworkService.self, service: DefaultNetworkService())
    }
    
    // MARK: Protocols Methods
    
    func register<Service>(type: Service.Type, service: Any) {
        services["\(type)"] = service
    }
    
    func resolve<Service>(type: Service.Type) -> Service {
        guard let service = services["\(type)"] as? Service else {
            fatalError("\(type) service not registered")
        }
        
        return service
    }
}
