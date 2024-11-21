//
//  PhotoSwift.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 13/11/24.
//

import Foundation

struct Photo: Identifiable {
    var id = UUID()
    var name: String
}
let samplePhotos = (1...20).map { Photo(name: "coffee-\($0)")}
