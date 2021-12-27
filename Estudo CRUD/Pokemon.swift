//
//  Pokemon.swift
//  Estudo CRUD
//
//  Created by Luana Martinez de La Flor on 01/12/21.
//

import Foundation


struct ListPokemmon: Codable {
    
    let results: [PokeName]
    
}

struct PokeName: Codable {
    
    let name: String
    let url: String
    
}



struct Pokemon: Codable {
    
    let height: Int?
    let id: Int?
    let name: String?
    let sprites: Sprites
    let types: [Types]
    let weight: Int?
    
    }

struct Sprites: Codable {
    
   let other: Other
}

struct Other: Codable {
    
    let officialArtWork: OfficialArtWork
    
    enum CodingKeys: String, CodingKey {
        
        case officialArtWork = "official-artwork"
    }
    
}

struct OfficialArtWork: Codable {
    
    let front_default: String
    
}

struct Types: Codable {
    
    let slot: Int
    let type: Type
    
}

struct Type: Codable {
    
    let name: String
    let url: String
    
    
}
