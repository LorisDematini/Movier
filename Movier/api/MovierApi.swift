//
//  MovierApi.swift
//  Movier
//
//  Created by Loris Dematini on 30/09/2022.
//

import Alamofire
import SwiftyJSON
import PromiseKit

class MovierApi {
    static func getMovies() -> Promise<[Movie]> {
        var movies: [Movie] = []
        
        return Promise { seal in
            AF.request("https://api.themoviedb.org/3/discover/movie?with_people=287&api_key=dd21c2df15fa3f1c86638f78d1775ef0&language=en-US&page=1").response { response in
                let json = JSON(response.data as Any)
                
                if let movieJsonArray = json.dictionary?["results"]?.arrayValue {
                    let movie = movieJsonArray[6]["tagline"]
                    print(movie)
                    for movie in movieJsonArray {
                        movies.append(Movie(
                            id: movie["id"].intValue,
                            title: movie["title"].stringValue,
                            overview: movie["overview"].stringValue,
                            release_date: movie["release_date"].stringValue,
                            poster_path: movie["poster_path"].stringValue,
                            
                            /*A COMPLETER*/))
                    }
                }

                
                seal.fulfill(movies)
            }
        }
    }
}
