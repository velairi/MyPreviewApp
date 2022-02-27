//
//  ContentView.swift
//  MyPreviewApp
//
//  Created by Valerie Don on 2/18/22.
//

import SwiftUI

struct ContentView: View {

    let data = Array(1...50).map { "Item \($0)" }

    let layout = [
        GridItem(.adaptive(minimum: 80))
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout, spacing: 20) {
                ForEach(data, id: \.self) { item in
                    VStack {
                        Capsule()
                            .fill(Color.blue)
                            .frame(height: 50)

                        Text(item)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }.padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
