//
//  GeneralRoute.swift
//  Ionix App
//
//  Created by Carlos Villamizar on 6/8/21.
//

import Foundation
import UIKit

enum GeneralRoute: IRouter {
    case home
}

extension GeneralRoute {
    var scene: UIViewController? {
        switch self {
        case .home:
            return HomeViewController()
        }
    }
}
