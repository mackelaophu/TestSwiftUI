//
//  FunFactView.swift
//  TestSwiftUI
//
//  Created by PhamHai Dang on 03/11/2023.
//

import SwiftUI

struct FunFactView: View {
    @State private var funFact = ""
    var body: some View {
        VStack{
           Text("Fun facts")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(funFact)
                .font(.title)
                .padding()
                .frame(minHeight: 400)
            Button("Show random funFact"){
                guard let randomElement = information.funFacts.randomElement() else {
                    funFact = ""
                    return
                }
                funFact = randomElement
            }.controlSize(.large)
        }
        .padding()
    }
}

struct FunFactView_Previews: PreviewProvider {
    static var previews: some View {
        FunFactView()
    }
}
