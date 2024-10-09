//
//  APIServiceProtocol.swift
//  RESTAPI
//
//  Created by Nivedha Rajendran on 09.10.24.
//

import Foundation

protocol APIServiceProtocol {
    func fetchBreeds(url: URL?, completion: @escaping(Result<[Breed], NetworkingError>) -> Void)
}
