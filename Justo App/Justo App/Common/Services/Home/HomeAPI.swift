//
//  HomeAPI.swift
//  Justo App
//
//  Created by Carlos Villamizar on 6/8/21.
//

import Foundation

class HomeAPI: HomeServiceProtocol {
    
    // Comunication with EndPoint
    func profile(request: Home.Profile.Request, completion: @escaping (Result<Home.Profile.Response, HomeError>) -> Void) {
        NetworkService.share.request(endpoint: HomeEndpoint.getProfile) { result in
            switch result {
            case .success:
                do {
                    let data = try result.get()
                    let response = try JSONDecoder().decode(Home.Profile.Response.self, from: data!)
                    completion(.success(response))
                } catch let error {
                    completion(.failure(.parse(error)))
                }
            case .failure(let error):
                completion(.failure(.network(error)))
            }
        }
    }
}
