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
        let link = "https://api.themoviedb.org/3/person/popular?api_key=dd21c2df15fa3f1c86638f78d1775ef0&page=13"
        return Promise { seal in
            AF.request(link).response { response in
                let json = JSON(response.data as Any)
                
                if let actorJsonArray = json.dictionary?["results"]?.arrayValue {
                    for actor in actorJsonArray {
                        actors.append(Actor(
                            id: actor["id"].intValue,
                            name: actor["name"].stringValue,
                            poster_path: actor["poster_path"].stringValue))
                    }
                }

                
                seal.fulfill(actors)
            }
        }
    }
}
