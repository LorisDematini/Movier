//
//  Actor.swift
//  Movier
//
//  Created by Loris Dematini on 07/10/2022.
//

class Actor {
    let id : Int
    let name : String
    let poster_path : String
    
    init(id:Int, name : String, poster_path : String){
        self.id = id
        self.name = name
        self.poster_path = poster_path
    }
}
