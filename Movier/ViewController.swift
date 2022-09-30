//
//  ViewController.swift
//  Movier
//
//  Created by Loris Dematini on 30/09/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleMovier: UILabel!
    
    @IBOutlet weak var boutonList: UIButton!
    
    @IBOutlet weak var boutonText: UILabel!
    
    var movies: [Movie] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movies List"
        refreshMovieList()
    }
    
    //MARK: - Custom Functions
    func refreshMovieList() {
        self.movies.removeAll()
        MovierApi.getMovies().done { moviesResponse in
            self.movies = moviesResponse
            self.tableView.reloadData()
        }
    }
    
    
    //MARK: - Datasource
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "movieCell")
        
        cell.textLabel?.text = self.movies[indexPath.row].title
        
        return cell
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
    
    
    //MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToMovieDescription" {
            
            let movie = sender as? Movie
            
            if let viewControllerDestination = segue.destination as? MovieDescriptionViewController {
                viewControllerDestination.movie = movie
            }
            
        }
    }
    
    
}
