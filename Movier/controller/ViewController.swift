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
    
    
    @IBOutlet weak var boutonPick: UIButton!
    
    @IBOutlet weak var labelPick: UILabel!
    

    
    var movies: [Movie] = []
    var movie: Movie? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()
        boutonText.text = "Current Movie's List"
        labelPick.text = "Generator"
    }
    
}

