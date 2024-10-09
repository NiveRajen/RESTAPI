//
//  LoadingView.swift
//  RESTAPI
//
//  Created by Nivedha Rajendran on 09.10.24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 20)  {
                    Text("😸")
                        .font(.system(size: 80))
                    ProgressView()
                    Text("Getting the cats ...")
                        .foregroundColor(.gray)
                    
                }
    }
}


#Preview {
    LoadingView()
}
