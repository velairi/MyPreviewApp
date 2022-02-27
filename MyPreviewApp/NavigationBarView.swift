//
//  NavigationBarView.swift
//  MyPreviewApp
//
//  Created by Valerie Don on 2/26/22.
//
import UIKit
import SwiftUI

struct NavigationBarView: View {

    let data = Array(1...50).map { "Item \($0)" }
    let layout = [
        GridItem(.adaptive(minimum: 80))
    ]

    @State private var image = UIImage()
    @State private var showSheet = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: layout, spacing: 20) {
                    if data.count == 0 {
                        Text("Add some photos!")
                    }

                    let rows = data.count / 4
                    ForEach(data, id: \.self) { item in
                        VStack {
                            RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
                                .fill(Color.blue)
//                                .frame(maxWidth: .infinity/4, maxHeight: 85)
                                .frame(width: 85, height: 85)
                            Text(item)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }.padding(.horizontal)
                .navigationTitle("Preview App")
                .toolbar {
                    Button("+") {
                        showSheet = true
                    }
                    .font(.largeTitle)
                    .sheet(isPresented: $showSheet) {
                        ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                    }
                }
        }
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
    }
}
