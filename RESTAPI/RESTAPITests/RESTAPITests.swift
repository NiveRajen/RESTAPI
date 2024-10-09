//
//  RESTAPITests.swift
//  RESTAPITests
//
//  Created by Nivedha Rajendran on 09.10.24.
//

import XCTest
@testable import RESTAPI

import Combine

final class RESTAPITests: XCTestCase {
    override func setUp() {
        
    }
    
    override func tearDown() {
        subscriptions = []
    }
    
    var subscriptions = Set<AnyCancellable>()
    
    func test_getting_breeds_success() {
        let result = Result<[Breed], NetworkingError>.success([Breed.example1()])
        
        let fetcher = BreedAPI(service: APIMockService(result: result))
        
        let promise = expectation(description: "getting breeds")
        
        fetcher.$breeds.sink { breeds in
            if breeds.count > 0 {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        
        wait(for: [promise], timeout: 2)
    }
    
    
    func test_loading_error() {
        
        let result = Result<[Breed], NetworkingError>.failure(NetworkingError.unableToCreateURL)
        let fetcher = BreedAPI(service: APIMockService(result: result))
        
        let promise = expectation(description: "show error message")
        fetcher.$breeds.sink { breeds in
            if !breeds.isEmpty {
                XCTFail()
            }
        }.store(in: &subscriptions)
        
        
        fetcher.$errorMessage.sink { message in
            if message != nil {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        wait(for: [promise], timeout: 2)
        
    }
}
