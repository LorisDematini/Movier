//
//  PickViewController.swift
//  Movier
//
//  Created by Loris Dematini on 06/10/2022.
//

import Foundation
import WebKit

class PickListViewController: UITableViewController {
    
    var movie: Movie? = nil
    var movies: [Movie] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Generated Movies"
        refreshMovieList()
    }
    func refreshMovieList() {
        self.movies.removeAll()
        MovierApi.randomMovies().done { movieResponse in
            self.movies = movieResponse
            self.tableView.reloadData()
        }.catch { _ in
            MovierApi.randomMovies().done { movieResponse in
                self.movies = movieResponse
                self.tableView.reloadData()
            }.catch { _ in
                MovierApi.randomMovies().done { movieResponse in
                    self.movies = movieResponse
                    self.tableView.reloadData()
                }.catch { _ in
                    MovierApi.randomMovies().done { movieResponse in
                        self.movies = movieResponse
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToPickMovieDescription" {
            
            let movie = sender as? Movie
            
            if let viewControllerDestination = segue.destination as? PickMovieDescriptionViewController {
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
        self.performSegue(withIdentifier: "segueToPickMovieDescription", sender: movies[indexPath.row])
    }
}
