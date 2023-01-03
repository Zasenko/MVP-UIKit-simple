//
//  ModulBilder.swift
//  MVP-UIKit
//
//  Created by Dmitry Zasenko on 03.01.23.
//

import UIKit

protocol Bilder {
    static func createMainModul() -> UIViewController
    static func createDetailModul(comment: Comment?) -> UIViewController
}

class ModulBilder: Bilder {
    static func createMainModul() -> UIViewController {
        let networkService = NetworkService()
        let view = MainViewController()
        let presenter = MainViewPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    static func createDetailModul(comment: Comment?) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresentor(view: view, networkService: networkService, comment: comment)
        view.presenter = presenter
        return view
    }
}
