//
//  HomeError.swift
//  Justo App
//
//  Created by Carlos Villamizar on 6/8/21.
//

import Foundation

enum HomeError: Error, CustomStringConvertible {
    case request
    case network(Error)
    case parse(Error)
    case server(description: String)
    
    var description: String {
        switch self {
        case .network(let error), .parse(let error):
            return error.localizedDescription
        case .request:
            return "Error request"
        case .server(let description):
            return description
        }
    }
}
