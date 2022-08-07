

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView(){
            GeometryReader{ geo in
            ZStack{
                    Image("pkmbg")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                        .opacity(1.0)
                    VStack(alignment: .center, spacing: 60){
                        NavigationLink {
                            PkmDex()
                        } label: {
                            Text("Choose Your Fighter")
                        }
                        .frame(width: 280, height: 50, alignment: .center)
                        .background(Color.red)
                        .font(.system(size: 25,weight: .bold, design:.default))
                        .cornerRadius(10)
                        .foregroundColor(.white)

                    /*Button{
                        print("tapped")
                    }
                    label:{
                        Text("To Battle")
                            .frame(width: 280, height: 50, alignment: .center)
                            .background(Color.red)
                            .font(.system(size: 35,weight: .bold, design:.default))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                     */
                    
                }
            }
            }
            
            .navigationTitle("Pokémon Battle")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
