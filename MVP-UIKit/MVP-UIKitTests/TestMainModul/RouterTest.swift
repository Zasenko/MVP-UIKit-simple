//
//  RouterTest.swift
//  MVP-UIKitTests
//
//  Created by Dmitry Zasenko on 11.01.23.
//

import XCTest
@testable import MVP_UIKit

class MockNavController: UINavigationController {
    var presentedVC: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        presentedVC = viewController
        super.pushViewController(viewController, animated: animated)
    }
}

final class RouterTest: XCTestCase {
    
    var router: RouterProtocol!
    var navigationController = MockNavController()
    let bilder = ModulBilder()
    
    override func setUp() {
        router = Router(navigationController: navigationController, builder: bilder)
    }

    override func tearDown() {
        router = nil
    }

    func testRouter() {
        router.showDetailController(comment: nil)
        let detailVC = navigationController.presentedVC
        XCTAssertTrue(detailVC is DetailViewController)
    }
}
