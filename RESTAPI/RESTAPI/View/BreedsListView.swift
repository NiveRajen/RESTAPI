//
//  BreedsList.swift
//  RESTAPI
//
//  Created by Nivedha Rajendran on 09.10.24.
//

import SwiftUI

struct BreedsListView: View {
    let breeds: [Breed]
    
    @State private var searchText: String = ""
    
    var filteredBreeds: [Breed] {
            if searchText.count == 0 {
              return breeds
            } else {
                return breeds.filter { $0.name.lowercased().contains(searchText.lowercased())
                }
            }
        }
    
    var body: some View {
        NavigationView {
                    List {
                        ForEach(filteredBreeds) { breed in
                            NavigationLink {
                                BreedDetailView(breed: breed)
                            } label: {
                                BreedRow(breed: breed)
                            }
                            
                        }
                    }
                    .listStyle(PlainListStyle())
                    .navigationTitle("Find Your Perfect Cat")
                    .searchable(text: $searchText)
                    
                }
    }
}


#Preview {
    BreedsListView(breeds: BreedAPI.successState().breeds)
}
