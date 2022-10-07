//
//  ActorDescritptionViewController.swift
//  Movier
//
//  Created by Loris Dematini on 07/10/2022.
//
import UIKit
import WebKit

class ActorDescriptionViewController: UIViewController {
    
    
    @IBOutlet weak var actorPictureView: UIImageView!
    
    var actor: Actor? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlBase = "https://image.tmdb.org/t/p/w300_and_h450_bestv2"
        if let safeActor = actor {
            
            self.title = safeActor.name
            
            if let url = URL(string: urlBase + safeActor.poster_path), let imgData = try? Data(contentsOf: url) {
                let image = UIImage(data: imgData)
                actorPictureView.image = image
            }
        } else {
            self.dismiss(animated: true, completion: nil)
        }
        
    }
}
