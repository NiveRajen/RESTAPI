//
//  ContentView.swift
//  RESTAPI
//
//  Created by Nivedha Rajendran on 09.10.24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var breedAPI: BreedAPI = BreedAPI()
    var body: some View {
        if breedAPI.isLoading {
            LoadingView()
        } else if breedAPI.errorMessage != nil {
            ErrorView(breedAPI: breedAPI)
        } else {
            BreedsListView(breeds: breedAPI.breeds)
        }
    }
}

#Preview {
    ContentView()
}
