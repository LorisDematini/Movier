//
//  ActorListViewController.swift
//  Movier
//
//  Created by Loris Dematini on 07/10/2022.
//
import Foundation
import WebKit

class ActorListViewController: UITableViewController {
    
    var actor: Actor? = nil
    var actors: [Actor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "List of Actors"
        refreshActorList()
    }
    
    
    func refreshActorList() {
        self.actors.removeAll()
        ActorApi.getActors().done { actorsResponse in
            self.actors = actorsResponse
            self.tableView.reloadData()
        }
    }
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToActorDescription" {
            
            let actor = sender as? Actor
            
            if let viewControllerDestination = segue.destination as? ActorDescriptionViewController {
                viewControllerDestination.actor = actor
            }
            
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
       let actorcell = UITableViewCell(style: .default, reuseIdentifier: "actorCell")
       
        actorcell.textLabel?.text = self.actors[indexPath.row].name
       
       return actorcell
   }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
       return actors.count
   }

    override func numberOfSections(in tableView: UITableView) -> Int {
       return 1
   }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "segueToActorDescription", sender: actors[indexPath.row])
    }
}
