//
//  HomeRouter.swift
//  Justo App
//
//  Created by Carlos Villamizar on 6/8/21.
//

import Foundation

@objc protocol HomeRoutingLogic {
}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get }
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {
    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?
    
}
