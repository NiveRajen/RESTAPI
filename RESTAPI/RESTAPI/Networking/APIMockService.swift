//
//  APIMockService.swift
//  RESTAPI
//
//  Created by Nivedha Rajendran on 09.10.24.
//


import Foundation

struct APIMockService: APIServiceProtocol {
    
    var result: Result<[Breed], NetworkingError>
    
    func fetchBreeds(url: URL?, completion: @escaping (Result<[Breed], NetworkingError>) -> Void) {
        completion(result)
    }
    
    
    
    
}
