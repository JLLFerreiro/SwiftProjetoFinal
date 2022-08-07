
import SwiftUI
import Kingfisher

struct Confirmation: View {
    var pokemon:Pokemon
    var body: some View {
        VStack{
        HStack{
            VStack(alignment: .leading, spacing: 5){
                Text(pokemon.name.capitalized)
                    .font(.title)
                HStack {
                    Text(pokemon.type.capitalized)
                        .italic()
                    Circle()
                        .foregroundColor(pokemon.typeColor)
                        .frame(width: 10, height: 10)
                }
                Text(pokemon.description)
                    .font(.caption)
                    .lineLimit(2)
                }
            
             Spacer()
             
             KFImage(URL(string: pokemon.imageURL))
             .interpolation(.none)
             .resizable()
             .frame(width: 100, height: 100)
             
            
            }
            
            NavigationLink(destination:Battle(pokemon: pokemon) , label:{Text("Confirm")} )
            
        }
    }
    }

struct Confirmation_Previews: PreviewProvider {
    static var previews: some View {
        Confirmation(pokemon:PokemonViewModel().MOCK_POKEMON)
    }
}
