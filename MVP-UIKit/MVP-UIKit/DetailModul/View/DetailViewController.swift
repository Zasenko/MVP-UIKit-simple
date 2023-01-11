//
//  DetailViewController.swift
//  MVP-UIKit
//
//  Created by Dmitry Zasenko on 03.01.23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lable: UILabel!
    
    var presenter: DetailViewPresentorProtocol!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setComment()
    }
    
    @IBAction func popButtonTapped(_ sender: UIButton) {
        presenter.tap()
    }
    

}

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        lable.text = comment?.body
    }
}
