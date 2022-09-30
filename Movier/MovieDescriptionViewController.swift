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
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var movie: Movie? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let safeMovie = movie {
            
            self.title = safeMovie.title
            self.degreeLabel.text = " titre : \(safeMovie.title)"
            self.descriptionLabel.text = safeMovie.overview
            
            if let url = URL(string: safeMovie.poster_path), let imgData = try? Data(contentsOf: url) {
                let image = UIImage(data: imgData)
                pictureImageView.image = image
            }
        } else {
            self.dismiss(animated: true, completion: nil)
        }
        
    }
}
