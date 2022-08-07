//
//  PkmnRandomizer.swift
//  Pokemon
//
//  Created by jj on 07/08/2022.
//

import Foundation
import SwiftUI


class Randomizer{
    
@Published var decider = Int.random(in: 1...18)
@Published var All
@Published var imgtrue:Image?
@Published var eatk:Int?
@Published var edef:Int?
@Published var satk:Int?
@Published var sdef:Int?

    init () {
        Task {
            All = try await detecting()
        }
    }
    
func detecting(){
switch decider{
case 1:
    imgtrue=Image("Regigigas")
case 2:
    imgtrue=Image("Regigigas")
case 3:
    imgtrue=Image("Regigigas")
case 4:
    imgtrue=Image("Regigigas")
case 5:
    imgtrue=Image("Regigigas")
case 6:
    imgtrue=Image("Regigigas")
case 7:
    imgtrue=Image("Regigigas")
case 8:
    imgtrue=Image("Regigigas")
case 9:
    imgtrue=Image("Regigigas")
case 10:
    imgtrue=Image("Regigigas")
case 11:
    imgtrue=Image("Regigigas")
case 12:
    imgtrue=Image("Regigigas")
case 13:
    imgtrue=Image("Regigigas")
case 14:
    imgtrue=Image("Regigigas")
case 15:
    imgtrue=Image("Regigigas")
case 16:
    imgtrue=Image("Regigigas")
case 17:
    imgtrue=Image("Regigigas")
case 18:
    imgtrue=Image("Regigigas")
default:
    imgtrue=Image("Regigigas")
}
}
}
