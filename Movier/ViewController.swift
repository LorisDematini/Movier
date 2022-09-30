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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        boutonList.setImage( UIImage.init(named: "image-cover"), for: .normal)
    }
}
