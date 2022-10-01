//
//  MovieListViewController.swift
//  Movier
//
//  Created by Loris Dematini on 30/09/2022.
//

import Foundation
import Alamofire
import UIKit

class MovieListViewController : UITableViewController {
    
    var movie: Movie? = nil
    var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movies List"
        refreshMovieList()
    }

    func refreshMovieList() {
        self.movies.removeAll()
        MovierApi.getMovies().done { moviesResponse in
            self.movies = moviesResponse
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToMovieDescription" {
            
            let movie = sender as? Movie
            
            if let viewControllerDestination = segue.destination as? MovieDescriptionViewController {
                viewControllerDestination.movie = movie
            }
            
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
       let moviecell = UITableViewCell(style: .default, reuseIdentifier: "movieCell")
       
       moviecell.textLabel?.text = self.movies[indexPath.row].title
       
       return moviecell
   }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
       return movies.count
   }

    override func numberOfSections(in tableView: UITableView) -> Int {
       return 1
   }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "segueToMovieDescription", sender: movies[indexPath.row])
    }
}
