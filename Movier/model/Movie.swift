//
//  Movie.swift
//  Movier
//
//  Created by Loris Dematini on 30/09/2022.
//

class Movie {
    let id : Int
    let title : String
    let overview : String
    let release_date : String
    let poster_path : String
    let vote_average : String
    
    init(id:Int, title : String, overview : String, release_date : String, poster_path : String, vote_average : String){
        self.id = id
        self.title = title
        self.overview = overview
        self.release_date = release_date
        self.poster_path = poster_path
        self.vote_average = vote_average
    }
}
