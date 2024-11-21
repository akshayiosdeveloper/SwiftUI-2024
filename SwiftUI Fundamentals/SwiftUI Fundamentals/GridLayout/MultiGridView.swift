//
//  MultiGridView.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 21/11/24.
//

import SwiftUI

struct MultiGridView: View {
    // @State var gridLayout = [ GridItem() ]
    @State var gridLayout = [ GridItem(.adaptive(minimum: 100)), GridItem(.flexible()) ]
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
    @State var showCoffeePhotos = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(sampleCafes) { cafe in
                        Image(cafe.image)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity) .frame(maxHeight: 150)
                            .cornerRadius(10)
                            .shadow(color: Color.primary.opacity(0.3), radius: 1)
                        
                        // nested lazy v grid
                        if showCoffeePhotos {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]) { ForEach(cafe.coffeePhotos) { photo in
                                Image(photo.name)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .frame(height: 50)
                                    .cornerRadius(10)
                                    .frame(minHeight: 0, maxHeight: .infinity, alignment: .top) .animation(.easeIn, value: gridLayout.count)
                            }
                                
                            }
                        }
                    }
                }
                .padding(.all, 10)
                .animation(.interactiveSpring(), value: gridLayout.count)
            }
            .navigationTitle("Coffee Feed")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button {
                            self.showCoffeePhotos.toggle()
                        } label: {
                            Image(systemName: "squares.below.rectangle")
                                .font(.title)
                                .foregroundColor(.primary)
                        }
                        
                        Button {
                            let minWidth: CGFloat = {
                                
                                // iPhone landscape mode
                                if verticalSizeClass == .compact {
                                    return 250.0
                                }
                                
                                // iPad
                                if horizontalSizeClass == .regular && verticalSizeClass == .regular {
                                    return 500.0
                                }
                                
                                return 100.0
                            }()
                            print("mindWidht----->\(minWidth)")
                            print("layout-->\(self.gridLayout)")
                            
                            self.gridLayout = self.gridLayout.count == 1 ? [ GridItem(.adaptive(minimum: minWidth)), GridItem(.flexible()) ] : [ GridItem() ]
                            
                            
                        }
                    label: {
                        Image(systemName: "rectangle.grid.3x2")
                            .font(.title)
                            .foregroundColor(.primary)
                    }
                    }
                }
                
            })
        }
        //        .onChange(of: verticalSizeClass) { value in
        //            self.gridLayout = [ GridItem(.adaptive(minimum: verticalSizeClass == .compact
        //                                                   ? 100 : 250)), GridItem(.flexible()) ]
        //        }
    }
    
    
}

#Preview {
    MultiGridView()
}
