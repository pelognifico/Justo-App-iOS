//
//  HomeWorkers.swift
//  Justo App
//
//  Created by Carlos Villamizar on 6/8/21.
//

import Foundation

protocol HomeServiceProtocol {
    func profile(request: Home.Profile.Request, completion: @escaping (Result<Home.Profile.Response, HomeError>) -> Void)
}

class HomeWorker: HomeServiceProtocol{
    
    var homeService: HomeServiceProtocol
    
    init(homeService: HomeServiceProtocol = HomeAPI()) {
        self.homeService = homeService
    }
    
    // Request the data
    func profile(request: Home.Profile.Request, completion: @escaping (Result<Home.Profile.Response, HomeError>) -> Void) {
        homeService.profile(request: request, completion: { result in
            completion(result)
        })
    }
    
}
