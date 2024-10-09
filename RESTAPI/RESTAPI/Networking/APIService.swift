//
//  APIService.swift
//  RESTAPI
//
//  Created by Nivedha Rajendran on 09.10.24.
//

import Foundation
import Combine

struct APIService: APIServiceProtocol {
    
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping (Result<T, NetworkingError>) -> Void) {
        
        guard let url = url else {
            completion(Result.failure(NetworkingError.unableToCreateURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error as? URLError {
                completion(Result.failure(NetworkingError.urlSessionError(error)))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    completion(Result.failure(NetworkingError.httpFailureResponseCode(statusCode: httpResponse.statusCode)))
                    return
                }
            }
                guard let data else {
                    completion(Result.failure(NetworkingError.noDataRecieved))
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(type, from: data)
                    
                    completion(Result.success(result))
                } catch {
                    completion(Result.failure(NetworkingError.unableToParseData(error as? DecodingError)))
                }
        }
        task.resume()
    }
    
        
    func fetchBreeds(url: URL?, completion: @escaping(Result<[Breed], NetworkingError>) -> Void) {
        fetch([Breed].self, url: url, completion: completion)
            
        }
    
//    2: The same code, refactored to make use of Combine to fetch data. Mapping data are not optimised at this stage.
    func fetchFeedsRefactored(url: URL?) -> AnyPublisher<[Breed], Never> {
        guard let url = url else {
            return Just([]).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { data, response in
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode([Breed].self, from: data)
                    return result
                }
                catch {
                    return []
                }
            }
            .replaceError(with: [])
            .eraseToAnyPublisher()
    }
    
    /// 3: The same code, making full use of Combine's capabilities for mapping data
        func fetchFeedsRefactoredAdvanced(url: URL?) -> AnyPublisher<[Breed], Never> {
            guard let url = url else {
                return Just([]).eraseToAnyPublisher()
            }
            
            return URLSession.shared.dataTaskPublisher(for: url)
                .map (\.data)
                .decode(type: [Breed].self, decoder: JSONDecoder())
                .replaceError(with: [])
                .eraseToAnyPublisher()
        }
}
