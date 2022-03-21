//
//  Person.swift
//  Random User
//
//  Created by Александр Иванов on 20.03.2022.
//

import Foundation

struct PersonResult: Decodable {
    let results: [Person]
}

struct Person: Decodable {
    let gender: String
    let name: PersonName
    let location: Location
    let email: String
    let phone: String
    let picture: Picture
}

struct PersonName: Decodable {
    let first: String
    let last: String
}

struct Location: Decodable {
    let street: Street
    let city: String
    let country: String
}

struct Street: Decodable {
    let number: Int
    let name: String
}

struct Picture: Decodable {
    let large: String
}


