//
//  HomeEndPoint.swift
//  Justo App
//
//  Created by Carlos Villamizar on 6/8/21.
//

import Foundation
import Alamofire

enum HomeEndpoint {
    case getProfile
}

extension HomeEndpoint: IEndpoint {
    var method: HTTPMethod {
        switch self {
        case .getProfile:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getProfile:
            return ""
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .getProfile:
            return nil
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .getProfile:
            return nil
        }
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
}
