//
//  PickMovieDescription.swift
//  Movier
//
//  Created by Loris Dematini on 06/10/2022.
//
import UIKit
import WebKit

class PickMovieDescriptionViewController: UIViewController {
    
    var movie: Movie? = nil
    
    @IBOutlet weak var pictureImageViewPick: UIImageView!
    
    @IBOutlet weak var overviewLabelPick: UILabel!
    
    @IBOutlet weak var voteLabelPick: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let urlBase = "https://image.tmdb.org/t/p/w300_and_h450_bestv2"
        if let safeMovie = movie {
            
            self.title = safeMovie.title
            self.overviewLabelPick.text = safeMovie.overview
            
            if let url = URL(string: urlBase + safeMovie.poster_path), let imgData = try? Data(contentsOf: url) {
                let image = UIImage(data: imgData)
                pictureImageViewPick.image = image
                print("LIEN ICI : ")
                print(url)
            }
            let note = String(safeMovie.vote_average.prefix(3))
            self.voteLabelPick.text = "Audience Rating : " + note + "/10"
            
        }else {
            self.dismiss(animated: true, completion: nil)
        }
        
    }
}
