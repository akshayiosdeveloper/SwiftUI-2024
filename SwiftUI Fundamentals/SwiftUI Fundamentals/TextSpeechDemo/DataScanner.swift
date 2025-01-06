//
//  DataScanner.swift
//  SwiftUIFundamentals
//
//  Created by Akshay Kumar on 06/01/25.
//

import Foundation
import VisionKit
import SwiftUI



struct DataScanner: UIViewControllerRepresentable {
    @Binding var startScanning: Bool
    @Binding var scanText: String
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    func makeUIViewController(context: Context) -> DataScannerViewController {
        let controller = DataScannerViewController(
        recognizedDataTypes: [.text()],
        qualityLevel: .balanced,
        isHighlightingEnabled: true
        )
        controller.delegate = context.coordinator
        return controller
    }
    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
        if startScanning {
            try? uiViewController.startScanning()
        } else {
            uiViewController.stopScanning()
        }
    }
    
    class Coordinator: NSObject, DataScannerViewControllerDelegate {
        var parent: DataScanner
        init(_ parent: DataScanner) {
            self.parent = parent
        }
        
        func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
            switch item {
            case .text(let text):
                parent.scanText = text.transcript
            default: break
            }
        }
       
       
    }

    
}

