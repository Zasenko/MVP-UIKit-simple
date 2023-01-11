//
//  MainPresenterTest.swift
//  MVP-UIKitTests
//
//  Created by Dmitry Zasenko on 03.01.23.
//

import XCTest
@testable import MVP_UIKit

class MockView: MainViewProtocol {
    func success() {}
    
    func failure(error: Error) {}
}

class MockNetworkService: NetworkServiceProtocol {
    
    var comments: [Comment]?
    
    init() {}
    
    convenience init(comments: [Comment]?) {
        self.init()
        self.comments = comments
    }
    
    func getComments(complition: @escaping (Result<[MVP_UIKit.Comment]?, Error>) -> Void) {
        if let comments = comments {
            complition(.success(comments))
        } else {
            let error = NSError(domain: "", code: 0)
            complition(.failure(error))
        }
    }
}

final class MainPresenterTest: XCTestCase {
    
    var view: MockView!
    var presenter: MainViewPresenter!
    var networkService: NetworkServiceProtocol!
    var router: RouterProtocol!
    var comments = [Comment]()
    
    override func setUp() {
        let navigationController = UINavigationController()
        let bilder = ModulBilder()
        router = Router(navigationController: navigationController, builder: bilder)
    }
    
    override func tearDown() {
        view = nil
        presenter = nil
        networkService = nil
        router = nil
        comments = []
    }
    
    func testGetSuccessComments() {
        let comment = Comment(postId: 1, id: 2, name: "Foo", email: "Boo", body: "Baz")
        comments.append(comment)
        
        view = MockView()
        networkService = MockNetworkService(comments: [comment])
        presenter = MainViewPresenter(view: view, networkService: networkService, router: router)
        
        var catchComments: [Comment]?
        
        networkService.getComments { result in
            switch result {
            case .success(let comments):
                catchComments = comments
            case .failure(let error):
                print(error)
            }
        }
        
        XCTAssertNotEqual(catchComments?.count, 0)
        XCTAssertEqual(catchComments?.count, comments.count)
    }
    func testGetFailureComments() {
        let comment = Comment(postId: 1, id: 2, name: "Foo", email: "Boo", body: "Baz")
        comments.append(comment)
        
        view = MockView()
        networkService = MockNetworkService()
        presenter = MainViewPresenter(view: view, networkService: networkService, router: router)
        
        var catchError: Error?
        
        networkService.getComments { result in
            switch result {
            case .success(_):
                break
            case .failure(let error):
                catchError = error
            }
        }
        
        XCTAssertNotNil(catchError)
    }
}
