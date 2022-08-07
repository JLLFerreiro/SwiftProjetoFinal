

import SwiftUI
import Kingfisher

struct PokemonDetailView: View {
    var pokemon: Pokemon
    
    var body: some View {
        GeometryReader { geo in
            VStack{
                Text(pokemon.name.capitalized)
                    .font(.largeTitle)
                
                Text(pokemon.type.capitalized)
                    .italic()
                    .foregroundColor(pokemon.typeColor)
                
                
                 PokemonImage(image: KFImage(URL(string: pokemon.imageURL)))
                    .padding(.bottom, -100)
                    .zIndex(1)
                 
                
                ZStack{
                    Rectangle()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: geo.size.width, height: geo.size.height)
                        .foregroundColor(pokemon.typeColor)
                    VStack{
                        Text(pokemon.description
                            .replacingOccurrences(of: "\n", with: ""))
                        .foregroundColor(.white)
                        .padding()
                        
                        StatsViewGroup(pokemon: pokemon)                    }
                    
                    
                }
                                
                  
                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing, content: {
                NavigationLink(destination:Confirmation(pokemon: pokemon) , label:{Text("To Battle")} )
            })
        })
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: PokemonViewModel().MOCK_POKEMON)
    }
}
