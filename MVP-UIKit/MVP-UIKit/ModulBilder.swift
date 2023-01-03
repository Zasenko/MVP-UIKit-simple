//
//  ModulBilder.swift
//  MVP-UIKit
//
//  Created by Dmitry Zasenko on 03.01.23.
//

import UIKit

protocol Bilder {
    static func createMainModul() -> UIViewController
}

class ModulBilder: Bilder {
    static func createMainModul() -> UIViewController {
        let model = Person(firstName: "Dmitry", lastName: "Zasenko")
        let view = MainViewController()
        let presenter = MainViewPresenter(view: view, person: model)
        view.presenter = presenter
        return view
    }
}
