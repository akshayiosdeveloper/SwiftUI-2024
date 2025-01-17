//
//  ScrollViewReaderDashboard.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 23/12/24.
//

import SwiftUI

struct ScrollViewReaderDashboard: View {
    @State private var photoSet = samplePhotos
    @State private var selectedPhotos: [Photo] = []
    @State private var selectedPhotoId: UUID?
    @Namespace private var photoTransistion
    var body: some View {
        VStack {
            ScrollView {
                HStack {
                    Text("Photos")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.heavy)
                    Spacer()
                }
                LazyVGrid(columns: [ GridItem(.adaptive(minimum: 50)) ]) {
                    ForEach(photoSet) { photo in
                        Image(photo.name)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 60)
                            .cornerRadius(3.0)
                            .onTapGesture {
                                selectedPhotos.append(photo)
                                selectedPhotoId = photo.id
                                if let index = photoSet.firstIndex(where: { $0.id == photo.id }) {
                                    photoSet.remove(at: index)
                                }
                            }
                            .matchedGeometryEffect(id: photo.id, in: photoTransistion)
                        
                    }
                }
            }
        }
        ScrollViewReader { scrollProxy in
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [ GridItem() ]) {
                ForEach(selectedPhotos) { photo in
                    Image(photo.name)
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 100)
                        .cornerRadius(3.0)
                        .id(photo.id)
                        .matchedGeometryEffect(id: photo.id, in: photoTransistion)

                        .onTapGesture {
                            photoSet.append(photo)
                            if let index = selectedPhotos.firstIndex(where: { $0.id == photo.id }) {
                                selectedPhotos.remove(at: index)
                            }
                        }
                    
                }
            }
        }
        .frame(height: 100)
        .background(Color(.systemGray6))
        .cornerRadius(5)
        .padding()
        .animation(.interactiveSpring(), value: selectedPhotoId)
        .onChange(of: selectedPhotoId) { id in
            guard id != nil else { return }
            scrollProxy.scrollTo(id)
        }
        
    }
    }
}

#Preview {
    ScrollViewReaderDashboard()
}
