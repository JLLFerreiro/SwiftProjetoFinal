

import SwiftUI

struct StatsViewGroup: View {
    
    var pokemon: Pokemon
    
    var body: some View {
        ZStack{
                Rectangle()
                .frame(width: 300, height: 175)
                .foregroundColor(.white)
                .opacity(0.6)
                .cornerRadius(20)
            
            VStack(alignment: .leading, spacing: 20){
                StatView(pokemon: pokemon, statName: "Atk", statColor: .red, statValue: pokemon.attack)
                StatView(pokemon: pokemon, statName: "Def", statColor: .blue, statValue: pokemon.defense)
                StatView(pokemon: pokemon, statName: "Hgt", statColor: .teal, statValue: pokemon.height)
                StatView(pokemon: pokemon, statName: "Wgt", statColor: .cyan, statValue: pokemon.weight)
            }
        }
    }
}

struct StatsViewGroup_Previews: PreviewProvider {
    static var previews: some View {
        StatsViewGroup(pokemon: PokemonViewModel().MOCK_POKEMON)
    }
}
