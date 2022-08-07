//
//  PokemonViewModel.swift
//  Pokemon
//
//  Created by jj on 03/08/2022.
//

import SwiftUI

struct Pokemon: Identifiable, Decodable{
    let pokeID = UUID()
    
    let id :Int
    let name: String
    let imageURL: String
    let type: String
    let description: String
    
    
    let attack: Int
    let defense: Int
    let height:Int
    let weight: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageURL = "imageUrl"
        case type
        case description
        case attack
        case defense
        case height
        case weight
        
        
    }
    var typeColor: Color {
    switch type {
    case "fire":return Color(.systemRed)
    case "poison":return Color(.systemGreen)
    case "water":return Color(.systemBlue)
    case "eletric":return Color(.systemYellow)
    case "psychic":return Color(.systemPurple)
    case "normal":return Color(.systemOrange)
    case "Ground":return Color(.systemBrown)
    case "flying":return Color(.systemTeal)
    case "fairy":return Color(.systemPink)
    default:return Color(.systemIndigo)
    }
    }
}

enum FetchError: Error{
    case badURL
    case badResponse
    case badData
}

class PokemonViewModel: ObservableObject {
    @Published var pokemon = [Pokemon]().self
    
    init () {
        async {
            pokemon = try await getPokemon()
        }
    }
    
    func getPokemon () async throws -> [Pokemon]{
        guard let url = URL(string: "https://pokedex-bb36f.firebaseio.com/pokemon.json")  else {throw FetchError.badURL}
    
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let data = data.removeNullsFrom(string: ".null,") else{ throw FetchError.badData}
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badResponse}
        
        let maybePokemonData = try JSONDecoder().decode([Pokemon].self, from: data)
        return maybePokemonData
    }
    
    let MOCK_POKEMON = Pokemon(id: 0, name: "Bulbasaur", imageURL: "https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqa0l5d2xSNVUxTWFZOFQzSExjUy1KSW9LeDMxUXxBQ3Jtc0trVHJjS3ZuUFFQQ0NNbVJ4RGVsVWRHMjdvc3A5TS1RdnJpeGFYNTdaaEduOVR6NG1FVHZIdERfVXY2NmY1VkVjMll3ZnRaOFFkSjB0Z0lyT2RPc0R0QWRRT3kzQ25oMHBicXhCZUVyM3ZLSlJrLUtDWQ&q=https%3A%2F%2Ffirebasestorage.googleapis.com%2Fv0%2Fb%2Fpokedex-bb36f.appspot.com%2Fo%2Fpokemon_images%252F2CF15848-AAF9-49C0-90E4-28DC78F60A78%3Falt%3Dmedia%26token%3D15ecd49b-89ff-46d6-be0f-1812c948e334&v=dcPS-K5H6hc", type: "poison", description: "This is a test example of what the text in the description would look like for the given pokemon. This is a test example of what the text in the description would look like for the given pokemon.", attack: 49, defense: 52, height: 10, weight: 98)
}

extension Data{
    func removeNullsFrom(string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parseDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parseDataString?.data(using: .utf8) else {return nil}
        return data
    }
}

