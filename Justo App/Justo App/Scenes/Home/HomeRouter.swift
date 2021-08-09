//
//  HomeRouter.swift
//  Justo App
//
//  Created by Carlos Villamizar on 6/8/21.
//

import Foundation

@objc protocol HomeRoutingLogic {
    func routeToAccessCamera()
}

protocol HomeDataPassing {
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {
    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?
    
    // MARK: - Routing
    // Access to GeneralRoute that contain the routes
    func routeToAccessCamera() {
//        navigateToAccessCamera(source: viewController!, destination: GeneralRoute.accessCamera)
    }
    
    // MARK: - Navigation
    // Navigate to AccessCameraViewControlller
    func navigateToAccessCamera(source: HomeViewController, destination: GeneralRoute) {
        guard let accessCameraVC = destination.scene else { return }
        source.navigationController?.pushViewController(accessCameraVC, animated: true)
    }
}
