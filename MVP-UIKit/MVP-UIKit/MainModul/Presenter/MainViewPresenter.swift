//
//  MainViewPresenter.swift
//  MVP-UIKit
//
//  Created by Dmitry Zasenko on 03.01.23.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func setGreeting(greeting: String)
}

protocol MainViewPresenerProtocol: AnyObject {
    init(view: MainViewProtocol, person: Person)
    func showGreeting()
}

class MainViewPresenter: MainViewPresenerProtocol {
    
    weak var view: MainViewProtocol?
    let person: Person
    
    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = person.firstName + " " + person.lastName
        self.view?.setGreeting(greeting: greeting)
    }
}
