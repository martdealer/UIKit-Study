//
//  ViewController.swift
//  TableView
//
//  Created by zsm on 11/17/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var moviesArray: [Movie] = [
        Movie(movieImage: UIImage(named: "batman"), movieName: "배트맨", movieDescription: "배트맨이 출연하는 영화")
    
    
    
    
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        cell.mainImageView.image = moviesArray[indexPath.row].movieImage
        cell.movieNameLabel.text = moviesArray[indexPath.row].movieName
        cell.descriptionLabel.text = moviesArray[indexPath.row].movieDescription
        
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = 120
    }


}

