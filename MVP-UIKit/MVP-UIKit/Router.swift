//
//  RouterProtocol.swift
//  MVP-UIKit
//
//  Created by Dmitry Zasenko on 03.01.23.
//

import UIKit

protocol AbstractRouterProtocol {
    var navigationController: UINavigationController? { get set }
    var builder: BuilderProtocol? { get set }
}

protocol RouterProtocol: AbstractRouterProtocol {
    func initialViewController()
    func showDetailController(comment: Comment?)
    func popToRoot()
}

class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    var builder: BuilderProtocol?
    
    init(navigationController: UINavigationController, builder: BuilderProtocol) {
        self.navigationController = navigationController
        self.builder = builder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = builder?.createMainModul(router: self) else { return }
            navigationController.viewControllers = [mainViewController]
        }
    }
    
    func showDetailController(comment: Comment?) {
        if let navigationController = navigationController {
            guard let datailViewController = builder?.createDetailModul(comment: comment, router: self) else { return }
            navigationController.pushViewController(datailViewController, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
