//
//  ErrorView.swift
//  RESTAPI
//
//  Created by Nivedha Rajendran on 09.10.24.
//

import SwiftUI

struct ErrorView: View {
    
    @ObservedObject var breedAPI: BreedAPI
    
    var body: some View {
        VStack {
                    
                    Text("😿")
                        .font(.system(size: 80))
                    
            Text(breedAPI.errorMessage ?? "")
                    
                    Button {
                        breedAPI.breedAPI()
                    } label: {
                        Text("Try again")
                    }

                    
                }
    }
}


#Preview {
    ErrorView(breedAPI: BreedAPI())
}
