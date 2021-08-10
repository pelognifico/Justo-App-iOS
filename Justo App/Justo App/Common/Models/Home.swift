//
//  Home.swift
//  Justo App
//
//  Created by Carlos Villamizar on 6/8/21.
//

import Foundation

// MARK: - Response Home
struct ResponseHome: Codable {
    let person: DataProfile
}

// MARK: - Foundation
struct Results : Codable {
    let results: DataProfile
}

struct Info : Codable {
    let seed: String
    let results: Int
    let page: Int
    let version: String
}

struct DataProfile : Codable {
    let gender: String?
    let name: Name
    let location: Location
    let email: String
    let login: Login
    let cell: String?
    let dob: Dob
    let picture: Picture
}

struct Name : Codable {
    let title: String?
    let first: String?
    let last: String?
}

struct Location : Codable {
    let city: String?
    let state: String?
    let country: String?
}

struct Login : Codable {
    let username: String
    let password: String
}

struct Dob : Codable {
    let age: Int?
    let date: String?
}

struct Picture : Codable {
    let large: String
    let medium: String
    let thumbnail: String
}

