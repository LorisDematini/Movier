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
        let link = "https://api.themoviedb.org/3/movie/now_playing?api_key=dd21c2df15fa3f1c86638f78d1775ef0&language=en-US"
        return Promise { seal in
            AF.request(link).response { response in
                let json = JSON(response.data as Any)
                
                if let movieJsonArray = json.dictionary?["results"]?.arrayValue {
                    for movie in movieJsonArray {
                        movies.append(Movie(
                            id: movie["id"].intValue,
                            title: movie["title"].stringValue,
                            overview: movie["overview"].stringValue,
                            release_date: movie["release_date"].stringValue,
                            poster_path: movie["poster_path"].stringValue,
                            vote_average: movie["vote_average"].stringValue
                            
                            /*A COMPLETER*/))
                    }
                }

                
                seal.fulfill(movies)
            }
        }
    }
    static func randomMovies() -> Promise<[Movie]> {
        var movies: [Movie] = []
        let minId = 62
        let maxId = 88542
        let linkBase = "https://api.themoviedb.org/3/movie/"
        let linkFinal = "?api_key=dd21c2df15fa3f1c86638f78d1775ef0"
        
        return Promise { seal in
                let randomValue = String(Int.random(in: minId...maxId))
                print("\(linkBase)\(randomValue)\(linkFinal)")
                    
                AF.request("\(linkBase)\(randomValue)\(linkFinal)").response { response in
                        
                    //print("request ok")
                    let json = JSON(response.data as Any)
                        
                    if let movieJsonArray = json.dictionary {
                        //let noteMin = movieJsonArray["vote_average"]
                        //print(noteMin)
                        //&& movieJsonArray["vote_average"] >= 7
                        if (movieJsonArray["success"] == nil){
                            movies.append(Movie(
                                id: movieJsonArray["id"]!.intValue,
                                title: movieJsonArray["title"]!.stringValue,
                                overview: movieJsonArray["overview"]!.stringValue,
                                release_date: movieJsonArray["release_date"]!.stringValue,
                                poster_path: movieJsonArray["poster_path"]!.stringValue,
                                vote_average: movieJsonArray["vote_average"]!.stringValue
                                    
                                /*A COMPLETER*/))
                            seal.fulfill(movies)
                            print("LE FILM EST OK")
                            //print(movieJsonArray["title"])
                        }else{
                            randomMovies()
                            print("LE FILM EST PAS OK")
                        }
                    }
                    
                    }
                }
            
            }
        
}
