//
//  MenuItem1.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 05/11/24.
//

import Foundation

struct MenuItem1: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var subMenuItems: [MenuItem1]?
}

// Sub-menu items for Espressco Machines
let espressoMachineMenuItems = [ MenuItem1(name: "Leva", image: "leva-x", subMenuItems: [ MenuItem1(name: "Leva X", image: "leva-x"), MenuItem1(name: "Leva S", image: "leva-s") ]),
                                 MenuItem1(name: "Strada", image: "strada-ep", subMenuItems: [ MenuItem1(name: "Strada EP", image: "strada-ep"), MenuItem1(name: "Strad a AV", image: "strada-av"), MenuItem1(name: "Strada MP", image: "strada-mp"), MenuItem1(name: "Strada EE", image: "strada-ee") ]),
                                 MenuItem1(name: "KB90", image: "kb90"),
                                 MenuItem1(name: "Linea", image: "linea-pb-x", subMenuItems: [ MenuItem1(name: "Linea PB X", image: "linea-pb-x"), MenuItem1(name: "Lin ea PB", image: "linea-pb"), MenuItem1(name: "Linea Classic", image: "linea-classic")]),
                                 MenuItem1(name: "GB5", image: "gb5"),
                                 MenuItem1(name: "Home", image: "gs3", subMenuItems : [ MenuItem1(name: "GS3", image: "gs3"), MenuItem1(name: "Linea Mini", image: "linea-mini") ])
]
let grinderMenuItems = [ MenuItem1(name: "Swift", image: "swift"), MenuItem1(name: "Vulcano", image: "vulcano"),
                         MenuItem1(name: "Swift Mini", image: "swift-mini"),
                         MenuItem1(name: "Lux D", image: "lux-d")
                        ]
// Sub-menu items for other equipment
let otherMenuItems = [ MenuItem1(name: "Espresso AV", image: "espresso-av"), MenuItem1(name: "Espresso EP", image: "espresso-ep"),
                       MenuItem1(name: "Pour Over", image: "pourover"),
                       MenuItem1(name: "Steam", image: "steam")
                        ]

// Main menu items
let sampleMenuItems = [ MenuItem1(name: "Espresso Machines", image: "linea-mini", subMenuItems: espressoMachineMenuItems),
                        MenuItem1(name: "Grinders", image: "swift-mini", subMenuItems: grinderMenuItems),
                        MenuItem1(name: "Other Equipment", image: "espresso-ep", subMenuItems: otherMenuItems)
]
