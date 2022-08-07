

import SwiftUI
import Kingfisher

struct PkmDex: View {
    @ObservedObject var pokemonVM = PokemonViewModel()  
    @State private var searchText = ""
    
    var filteredPokemon: [Pokemon] {
        if searchText == ""{ return pokemonVM.pokemon }
        return pokemonVM.pokemon.filter{
            $0.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        
            List{
                ForEach(filteredPokemon) { poke in
                    NavigationLink(destination: PokemonDetailView(pokemon: poke)){
                        HStack{
                            VStack(alignment: .leading, spacing: 5){
                                Text(poke.name.capitalized)
                                    .font(.title)
                                HStack {
                                    Text(poke.type.capitalized)
                                        .italic()
                                    Circle()
                                        .foregroundColor(poke.typeColor)
                                        .frame(width: 10, height: 10)
                                }
                                Text(poke.description)
                                    .font(.caption)
                                    .lineLimit(2)
                                }
                            
                             Spacer()
                             
                             KFImage(URL(string: poke.imageURL))
                             .interpolation(.none)
                             .resizable()
                             .frame(width: 100, height: 100)
                             
                            
                            }
                        }
                    }
            
            
                }
            .navigationTitle("Pokemon")
            .searchable(text: $searchText)
        
    }
}

struct PkmDex_Previews: PreviewProvider {
    static var previews: some View {
        PkmDex()
    }
}
