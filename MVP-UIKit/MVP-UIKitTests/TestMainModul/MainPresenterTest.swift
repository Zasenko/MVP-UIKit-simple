//
//  MainPresenterTest.swift
//  MVP-UIKitTests
//
//  Created by Dmitry Zasenko on 03.01.23.
//

import XCTest
@testable import MVP_UIKit

class MockView: MainViewProtocol {
    
    var titleTest: String?
    
    func setGreeting(greeting: String) {
        self.titleTest = greeting
    }
}

final class MainPresenterTest: XCTestCase {
    
    var view: MockView!
    var person: Person!
    var presenter: MainViewPresenter!

    override func setUp() {
        view = MockView()
        person = Person(firstName: "Baz", lastName: "Bar")
        presenter = MainViewPresenter(view: view, person: person)
    }
    
    override func tearDown() {
        view = nil
        person = nil
        presenter = nil
    }
    
    func testModulIsNotNil() {
        XCTAssertNotNil(view, "view is not nil")
        XCTAssertNotNil(person, "person is not nil")
        XCTAssertNotNil(presenter, "presenter is not nil")
    }
    
    func testView() {
        presenter.showGreeting()
        XCTAssertEqual(view.titleTest, "Baz Bar")
    }
    
    func testPersonModel() {
        XCTAssertEqual(person.firstName, "Baz")
        XCTAssertEqual(person.lastName, "Bar")
    }

}
