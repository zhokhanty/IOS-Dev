//
//  MoviesViewController.swift
//  FavouritesManagerApp
//
//  Created by Zhalgas Bagytzhan on 26.11.2025.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let provider = DataProvider()
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movies = provider.movies

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteTableViewCell", for: indexPath) as! FavouriteTableViewCell

        let movie = movies[indexPath.row]
        cell.configure(with: movie)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let selectedItem = movies[indexPath.row]

        let vc = DetailViewController()
        vc.item = selectedItem

        navigationController?.pushViewController(vc, animated: true)
    }

    
}
