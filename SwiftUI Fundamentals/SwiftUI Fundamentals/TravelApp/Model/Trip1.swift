//
//  Trip.swift
//  SwiftUICarousel
//
//  Created by Simon Ng on 17/8/2022.
//

import Foundation

struct Trip1: Identifiable {
    var id = UUID()
    var destination: String
    var image: String
}


let sampleTrips1 = [ Trip1(destination: "Paris", image: "paris"),
                    Trip1(destination: "Florence", image: "florence"),
                    Trip1(destination: "Amsterdam", image: "amsterdam"),
                    Trip1(destination: "Ghent", image: "ghent"),
                    Trip1(destination: "Santorini", image: "santorini"),
                    Trip1(destination: "Budapest", image: "budapest"),
                    Trip1(destination: "London", image: "london"),
                    Trip1(destination: "Cuba", image: "cuba"),
                    Trip1(destination: "Osaka", image: "osaka"),
                    Trip1(destination: "Kyoto", image: "kyoto"),
                    Trip1(destination: "Seoul", image: "seoul"),
                    Trip1(destination: "Sydney", image: "sydney"),
                    Trip1(destination: "Hong Kong", image: "hongkong")
]

