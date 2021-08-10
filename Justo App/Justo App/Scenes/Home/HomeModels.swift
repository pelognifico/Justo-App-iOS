//
//  HomeModels.swift
//  Justo App
//
//  Created by Carlos Villamizar on 6/8/21.
//

import Foundation
import UIKit

enum Home {
  
    // MARK: Use cases
    enum Profile {
        struct Request {
            //method get
        }
        
        struct Response: Codable {
            
            let info: Info
            let results: [DataProfile]
            
            enum CodingKeys: String, CodingKey {
                case info
                case results
            }
        }
        
        struct ViewModel {
            let info: Info
            let results: DataProfile
        }
    }

    enum Error {
        struct Request {
        }
        struct Response {
            var error: HomeError
        }
        struct ViewModel {
            var error: HomeError
        }
    }
}
