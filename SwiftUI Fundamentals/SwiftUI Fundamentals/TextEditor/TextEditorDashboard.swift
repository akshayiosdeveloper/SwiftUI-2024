//
//  TextEditorDashboard.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 09/12/24.
//

import SwiftUI

struct TextEditorDashboard: View {
    @State private var inputText = "z"
    @State private var wordCount: Int = 0
    var body: some View {
        ZStack(alignment: .topTrailing) {
            TextEditor(text: $inputText)
                .font(.body)
                .padding()
                .padding(.top, 20)
                .onChange(of: inputText) { value in
                    let words = inputText.split { $0 == " " || $0.isNewline }
                }
            
            Text("\(wordCount) words")
                .font(.headline)
                .foregroundColor(.secondary)
                .padding(.trailing)
        }
        
    }
}

#Preview {
    TextEditorDashboard()
}
