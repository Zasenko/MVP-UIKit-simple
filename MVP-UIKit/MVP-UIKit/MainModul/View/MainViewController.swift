//
//  MainViewController.swift
//  MVP-UIKit
//
//  Created by Dmitry Zasenko on 03.01.23.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - IBOutlet

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var presenter: MainViewPresenerProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    // MARK: - Functions
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let comment = presenter.comments?[indexPath.row]
        cell.textLabel?.text = comment?.body
        return cell
    }
}

extension MainViewController: UITableViewDelegate {}

extension MainViewController: MainViewProtocol {
    func success() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        debugPrint(error.localizedDescription)
    }
    

}
