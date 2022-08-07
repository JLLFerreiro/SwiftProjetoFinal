

import SwiftUI
import Kingfisher

struct Battle: View {
    var pokemon:Pokemon
    var decider = Int.random(in: 1...18)
    @State var eAtk = Int.random(in: 70...130)
    @State var eDef = Int.random(in: 30...180)
    @State var eHP = Int.random(in: 80...120)
    var sAtk = 0
    var sDef = 0
    @State var sHP = 100
    
    var body: some View {
        VStack{
            HStack{
                KFImage(URL(string: pokemon.imageURL))
                .interpolation(.none)
                .resizable()
                .frame(width: 100, height: 100)
                .padding(20)
                
                switch decider{
                case 1:
                    Image("regigigas")
                        .interpolation(.none)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(20)
                case 2:
                    Image("blaziken")
                        .interpolation(.none)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(20)
                case 3:
                    Image("mudkip")
                        .interpolation(.none)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(20)
                case 4:
                    Image("magneton")
                        .interpolation(.none)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(20)
                case 5:
                    Image("whimsicott")
                        .interpolation(.none)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(20)
                case 6:
                    Image("vanilite")
                        .interpolation(.none)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(20)
                case 7:
                    Image("Lucario")
                        .interpolation(.none)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(20)
                case 8:
                    Image("zubat")
                        .interpolation(.none)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(20)
                case 9:
                    Image("flygon")
                        .interpolation(.none)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(20)
                case 10:
                    Image("Staravia")
                        .interpolation(.none)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(20)
                case 11:
                    Image("galade")
                        .interpolation(.none)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(20)
                case 12:
                    Image("scizor")
                        .interpolation(.none)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(20)
                case 13:
                    Image("roggenrola")
                        .interpolation(.none)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(20)
                case 14:
                    Image("mismagius")
                        .interpolation(.none)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(20)
                case 15:
                    Image("druddigon")
                        .interpolation(.none)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(20)
                case 16:
                    Image("absol")
                        .interpolation(.none)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(20)
                case 17:
                    Image("aggron")
                        .interpolation(.none)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(20)
                case 18:
                    Image("sylveon")
                        .interpolation(.none)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(20)
                default:
                    Image("regigigas")
                        .interpolation(.none)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(20)
                }
            }
            HStack{
                Text("HP:\(sHP)")
                    .padding(10)
                Text("HP:\(eHP)")
                    .padding(10)
            }
           
             VStack{
             HStack{
             Button{
                 eHP = (65 + pokemon.attack)/eDef
                 sHP = sHP-(eAtk/3)
             }
            label:{
                Text("Atk 1")
                    .frame(width: 150, height: 50, alignment: .center)
                    .background(Color.blue)
                    .font(.system(size: 35,weight: .bold, design:.default))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
             Button{
                 eHP = (100 + pokemon.attack)/(eDef + 20)
                 sHP = sHP-(eAtk-50)
             }
             label:{
                 Text("Atk2")
                     .frame(width: 150, height: 50, alignment: .center)
                     .background(Color.blue)
                     .font(.system(size: 35,weight: .bold, design:.default))
                     .cornerRadius(10)
                     .foregroundColor(.white)
             }
             }
             HStack{
             Button{
                 eAtk = eAtk/2
                 sHP = sHP - 20
             }
             label:{
                 Text("Atk down")
                     .frame(width: 150, height: 50, alignment: .center)
                     .background(Color.blue)
                     .font(.system(size: 25,weight: .bold, design:.default))
                     .cornerRadius(10)
                     .foregroundColor(.white)
             }
             Button{
                 eDef = eDef/2
                 sHP = sHP-eAtk
             }
             label:{
                 Text("Def down")
                     .frame(width: 150, height: 50, alignment: .center)
                     .background(Color.blue)
                     .font(.system(size: 25,weight: .bold, design:.default))
                     .cornerRadius(10)
                     .foregroundColor(.white)
             }
             }
                 NavigationLink {
                     PkmDex()
                 } label: {
                     Text("Run/Leave")
                 }
                         .frame(width: 150, height: 50, alignment: .center)
                         .background(Color.red)
                         .font(.system(size: 25,weight: .bold, design:.default))
                         .cornerRadius(10)
                         .foregroundColor(.white)
                 }
                 
             }
             
    
    }
    
}


struct Battle_Previews: PreviewProvider {
    static var previews: some View {
        Battle(pokemon:PokemonViewModel().MOCK_POKEMON)
    }
}

