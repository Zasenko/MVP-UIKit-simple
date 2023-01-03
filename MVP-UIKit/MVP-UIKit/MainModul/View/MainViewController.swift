//
//  MainViewController.swift
//  MVP-UIKit
//
//  Created by Dmitry Zasenko on 03.01.23.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var greetingLable: UILabel!
    
    var presenter: MainViewPresenerProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Functions
    
    @IBAction func didTapButton(_ sender: Any) {
        self.presenter.showGreeting()
    }
}

extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        greetingLable.text = greeting
    }
}
