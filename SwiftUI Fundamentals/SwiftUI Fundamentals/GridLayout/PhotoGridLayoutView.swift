//
//  PhotoGridLayoutView.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 13/11/24.
//

import SwiftUI

struct PhotoGridLayoutView: View {
    @State var gridLayout:[GridItem] = [GridItem()]
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridLayout,alignment: .center, content: {
                    ForEach(samplePhotos.indices,id: \.self) { index in
                        Image(samplePhotos[index].name)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth:0,maxWidth: .infinity)
                            .frame(height: gridLayout.count == 1 ? 200 : 100)
                            .cornerRadius(10)
                            .shadow(color: Color.primary.opacity(0.3), radius: 1)
                    }
                })
                .padding(.all,10)
                
            }
            .navigationTitle("Coffee!")
            .animation(.interactiveSpring(), value: gridLayout.count)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.gridLayout = Array(repeating: .init(.flexible()), count: self.returnValue())
                        print("gridcount=\( self.gridLayout.count)")
                    } label: {
                        Image(systemName: "square.grid.2x2")
                            .font(.title)
                    }
                }
                
            })
        }
        
        
    }
    func returnValue() -> Int {
        print("start point \(self.gridLayout.count)")
        let value = self.gridLayout.count % 5 + 1
        print("---value--\(value)")
        return value

    }
    
}

#Preview {
    PhotoGridLayoutView()
}
