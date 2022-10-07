//
//  ActorApi.swift
//  Movier
//
//  Created by Loris Dematini on 07/10/2022.
//

import Alamofire
import SwiftyJSON
import PromiseKit

class ActorApi {
    static func getActors() -> Promise<[Actor]> {
        var actors: [Actor] = []
        let page = String(Int.random(in: 1...10))
        
        let link = "https://api.themoviedb.org/3/person/popular?api_key=dd21c2df15fa3f1c86638f78d1775ef0"
        return Promise { seal in
            AF.request("\(link)&page=\(page)").response { response in
                let json = JSON(response.data as Any)
                
                if let actorJsonArray = json.dictionary?["results"]?.arrayValue {
                    for actor in actorJsonArray {
                        actors.append(Actor(
                            id: actor["id"].intValue,
                            name: actor["name"].stringValue,
                            profile_path: actor["profile_path"].stringValue))
                    }
                }

                
                seal.fulfill(actors)
            }
        }
    }
    
    static func getActorMovies(actorID : Int) -> Promise<[Movie]> {
        var movies: [Movie] = []
        let linkID = String(actorID)
        let link = "https://api.themoviedb.org/3/person/\(linkID)/movie_credits?api_key=dd21c2df15fa3f1c86638f78d1775ef0&language=en-US"
        return Promise { seal in
            AF.request(link).response { response in
                let json = JSON(response.data as Any)
                
                if let movieJsonArray = json.dictionary?["cast"]?.arrayValue {
                    for movie in movieJsonArray {
                        movies.append(Movie(
                            id: movie["id"].intValue,
                            title: movie["title"].stringValue,
                            overview: movie["overview"].stringValue,
                            release_date: movie["release_date"].stringValue,
                            poster_path: movie["poster_path"].stringValue,
                            vote_average: movie["vote_average"].stringValue))
                    }
                }

                
                seal.fulfill(movies)
            }
        }
    }
}
