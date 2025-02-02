import XCTest
import UIKit
@testable import ResponderChain

var key123: ResponderKey<String> = ResponderKey(value: "123")

final class ResponderChainTests: XCTestCase {
    func testExample() {
        
        let rootView = UIView()
        
        let subView = UIView()
        
        let subSubView = UIView()
        
        rootView.addSubview(subView)
        subView.addSubview(subSubView)
        
        rootView.responder.register(key: key123) { (value: String) -> Bool in
            XCTAssertEqual(value, "123")
            return false
        }
        
        subView.responder.register(key: key123) { (value: String) -> Bool in
            XCTAssertEqual(value, "123")
            return true
        }
        
        subSubView.responder.handler(typeKey: key123, value: "123")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
