//
//  GridApiDemo.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 07/01/25.
//

import SwiftUI

struct GridApiDemo: View {
    var body: some View {
       // Grid3x3()
        GridWithImage()
    }
}

#Preview {
    GridApiDemo()
}
struct Grid3x3: View {
    var body: some View {
        Grid {
            GridRow {
                Color.purple
                Color.orange
                Color.indigo
            }
            
            GridRow {
                Color.green
                Color.yellow
                Color.red
            }
            GridRow {
                Color.brown
                Color.cyan
                Color.mint
            }

        }
    }
}

struct GridWithImage: View {
    var body: some View {
        Grid {
            GridRow {
                Image(systemName: "trash")
                    .font(.system(size: 100))
                Image(systemName: "trash")
                    .font(.system(size: 50))
            }
            GridRow {
                Color.green
                Color.yellow
            }
        }
    }
}
