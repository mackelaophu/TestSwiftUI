//
//  NoDataView.swift
//  TestSwiftUI
//
//  Created by PhamHai Dang on 03/11/2023.
//

import SwiftUI

struct NoDataView: View {
    @State var hidderBar : Bool
    var body: some View {
        VStack{
            Image(systemName: "questionmark.folder.ar")
                .resizable()
                .frame(maxWidth: 100, maxHeight: 100)
                
            Text("No Data")
                .font(.title2)
        }.navigationTitle("NoData")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(hidderBar)
    }
}

struct NoDataView_Previews: PreviewProvider {
    static var previews: some View {
        NoDataView(hidderBar: true)
    }
}
