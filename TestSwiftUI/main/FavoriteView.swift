//
//  FavoriteView.swift
//  TestSwiftUI
//
//  Created by PhamHai Dang on 03/11/2023.
//

import SwiftUI

struct FavoriteView: View {
    var body: some View {
        VStack{
            Text("Favorites")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Text("Hobies")
                .font(.title2)
            HStack(spacing: 60){
                ForEach(information.hobbies, id: \.self){ hobie in
                    Image(systemName: hobie)
                        .resizable()
                        .frame(maxWidth: 80, maxHeight: 60)
                }
            }.padding()
            Text("Foods")
                .font(.title2)
            HStack{
                ForEach(information.foods,id: \.self){ food in
                    Text(food)
                        .font(.system(size: 48))
                }
            }.padding()
            Text("Favorites Colors")
                .font(.title2)
            HStack(spacing: 60){
                ForEach(information.colors, id: \.self){
                    color in
                    color.frame(width: 70, height: 70)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
