//
//  HomeInteractor.swift
//  Justo App
//
//  Created by Carlos Villamizar on 6/8/21.
//

import Foundation
import UIKit

protocol HomeBusinessLogic {
    func profile(request: Home.Profile.Request)
}

protocol HomeDataStore {
    var profile: DataProfile? { get set }
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore {
    
    var presenter: HomePresentationLogic?
    var profile: DataProfile?
    
    var worker: HomeServiceProtocol
     
    init(worker: HomeServiceProtocol = HomeWorker()) {
        self.worker = worker
    }
    
    // MARK: - Methods
    
    // Handling the request and will return a response object to the Presenter.
    func profile(request: Home.Profile.Request) {
        
        worker.profile(request: request, completion: { result in
            switch result {
            case .success(let response):
                
                self.presenter?.presentProfile(response: response)
                
            case .failure(let error):
                let response = Home.Error.Response(error: error)
                self.presenter?.presentError(response: response)
            }
            
        })
    }
}
