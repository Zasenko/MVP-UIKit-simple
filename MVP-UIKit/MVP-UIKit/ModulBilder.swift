//
//  ModulBilder.swift
//  MVP-UIKit
//
//  Created by Dmitry Zasenko on 03.01.23.
//

import UIKit

protocol BuilderProtocol {
    func createMainModul(router: RouterProtocol) -> UIViewController
    func createDetailModul(comment: Comment?, router: RouterProtocol) -> UIViewController
}

class ModulBilder: BuilderProtocol {
    
    func createMainModul(router: RouterProtocol) -> UIViewController {
        let networkService = NetworkService()
        let view = MainViewController()
        let presenter = MainViewPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        return view
    }
    
    func createDetailModul(comment: Comment?, router: RouterProtocol) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresentor(view: view, networkService: networkService, router: router, comment: comment)
        view.presenter = presenter
        return view
    }
}
