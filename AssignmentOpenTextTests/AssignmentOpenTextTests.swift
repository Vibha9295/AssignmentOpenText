//
//  AssignmentOpenTextTests.swift
//  AssignmentOpenTextTests
//
//  Created by Mac on 15/08/23.
//

import XCTest
@testable import AssignmentOpenText

class AssignmentOpenTextTests: XCTestCase {
    var viewModel: LoginRegisterViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = LoginRegisterViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testLogin() {
        // Mock user data and test login logic
        let username = "testuser"
        let password = "testpassword"
        viewModel.register(username: username, password: password)
        
        XCTAssertTrue(viewModel.login(username: username, password: password))
    }
    
    func testRegister() {
        // Test registration logic
        let username = "newuser"
        let password = "newpassword"
        viewModel.register(username: username, password: password)
        
        XCTAssertTrue(viewModel.isLoggedIn)
        XCTAssertEqual(viewModel.user?.username, username)
    }
    
}

