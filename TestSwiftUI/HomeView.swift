//
//  HomeView.swift
//  TestSwiftUI
//
//  Created by PhamHai Dang on 03/11/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            Text("My Name")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Image(information.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .padding(40)
            Text(information.name)
                .font(.title)
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
