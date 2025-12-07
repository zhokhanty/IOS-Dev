//
//  CoursesViewController.swift
//  FavouritesManagerApp
//
//  Created by Zhalgas Bagytzhan on 26.11.2025.
//

import UIKit

class CoursesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let provider = DataProvider()
    var courses: [Course] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        courses = provider.courses

        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 88, bottom: 0, right: 16)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteTableViewCell", for: indexPath) as! FavouriteTableViewCell

        let course = courses[indexPath.row]
        cell.configure(with: course)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let selectedItem = courses[indexPath.row]

        let vc = DetailViewController()
        vc.item = selectedItem

        navigationController?.pushViewController(vc, animated: true)
    }

    
}
