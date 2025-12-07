//
//  HeroModel.swift
//  SuperheroRandomizerApp
//

import Foundation

struct HeroModel: Codable {
    let id: Int
    let name: String
    let powerstats: Powerstats
    let appearance: Appearance
    let biography: Biography
    let work: Work
    let images: HeroImage
    
    struct Powerstats: Codable {
        let intelligence: Int
        let strength: Int
        let speed: Int
        let durability: Int
        let power: Int
        let combat: Int
    }
    
    struct Appearance: Codable {
        let gender: String
        let race: String?
        let weight: [String]
        let height: [String]
    }
    
    struct Biography: Codable {
        let fullName: String
        let publisher: String?
        let alignment: String
    }
    
    struct Work: Codable {
        let occupation: String
        let base: String
    }
    
    struct HeroImage: Codable {
        let md: String
    }
}
