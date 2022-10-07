//
//  MovierViewController.swift
//  Movier
//
//  Created by Loris Dematini on 30/09/2022.
//
import UIKit
import WebKit

class MovieDescriptionViewController: UIViewController {
    
    
    @IBOutlet weak var pictureImageView: UIImageView!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    @IBOutlet weak var voteLabel: UILabel!
    
    var movie: Movie? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlBase = "https://image.tmdb.org/t/p/w300_and_h450_bestv2"
        if let safeMovie = movie {
            
            self.title = safeMovie.title
            self.overviewLabel.text = safeMovie.overview
            
            if let url = URL(string: urlBase + safeMovie.poster_path), let imgData = try? Data(contentsOf: url) {
                let image = UIImage(data: imgData)
                pictureImageView.image = image
            }
            let note = String(safeMovie.vote_average.prefix(3))
            self.voteLabel.text = "Audience Rating : " + note + "/10"
            
        } else {
            self.dismiss(animated: true, completion: nil)
        }
        
    }
}
