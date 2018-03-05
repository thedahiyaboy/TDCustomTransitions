//
//  HerbModel.swift
//  TDCustomTrans
//
//  Created by dahiyaboy on 05/03/18.
//  Copyright © 2018 dahiyaboy. All rights reserved.
//

import Foundation

struct HerbModel {
    
    let name: String
    let image: String
//    let license: String
//    let credit: String
//    let description: String
    
    static func all() -> [HerbModel] {
        return [
            HerbModel(name: "Basil",     image: "basil.jpg"),
            HerbModel(name: "Saffron",   image: "saffron.jpg"),
            HerbModel(name: "Marjoram",  image: "marjorana.jpg"),
            HerbModel(name: "Rosemary",  image: "rosemary.jpg"),
            HerbModel(name: "Anise",     image: "anise.jpg")
        ]
    }
    
}
