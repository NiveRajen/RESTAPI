//
//  BreedAPI.swift
//  RESTAPI
//
//  Created by Nivedha Rajendran on 09.10.24.
//

import Foundation


class BreedAPI: ObservableObject {
    @Published var breeds: [Breed] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        breedAPI()
    }
    func breedAPI() {
        isLoading = true
        errorMessage = nil
        
        service.fetchBreeds(url: URL(string: "https://api.thecatapi.com/v1/breeds")) { [weak self] result in
            DispatchQueue.main.async { [weak self] in
                self?.isLoading = false
                switch result {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    print(error)
                case .success(let breeds):
                    self?.breeds = breeds
                }
            }
        }
    }
    
    //MARK: preview Helpers
    static func errorState() -> BreedAPI {
        let api = BreedAPI()
        api.errorMessage = NetworkingError.urlSessionError(URLError.init(.notConnectedToInternet)).localizedDescription
        return api
    }
    
    static func successState() -> BreedAPI {
        let api = BreedAPI()
        api.breeds = [Breed.example1(), Breed.example2()]
        return api
    }
}
