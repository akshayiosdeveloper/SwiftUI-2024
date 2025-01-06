//
//  TextSpeechDemo.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 03/01/25.
//

import SwiftUI
import VisionKit
struct TextSpeechDemo: View {
@State private var startScanning = false
@State private var scanText = ""
    var body: some View {
        VStack(spacing: 0) {
            DataScanner(startScanning: $startScanning, scanText: $scanText)
                .frame(height: 400)
            Text(scanText)
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
                .background(in: Rectangle())
                .backgroundStyle(Color(uiColor: .systemGray6))
        }
        .task {
            if DataScannerViewController.isSupported && DataScannerViewController.isAvailable {
                startScanning.toggle()
            }
        }
    }
}

#Preview {
    TextSpeechDemo()
}
