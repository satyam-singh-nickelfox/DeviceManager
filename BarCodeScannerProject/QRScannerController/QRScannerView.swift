//
//  Scanner.swift
//  BarCodeScannerProject
//
//  Created by Satyam Singh on 09/07/24.
//

import Foundation
import SwiftUI

struct QRScannerView: UIViewControllerRepresentable {
    
    @Binding var result: String
    @Binding var isShowing: Bool
    @Binding var navigateToDetails: Bool
    @Binding var navigateToAddAsset: Bool
    
    var handleScan: (String) -> Void

    func makeCoordinator() -> Coordinator {
        Coordinator(result: $result, isShowing: $isShowing, navigateToDetails: $navigateToDetails, navigateToAddAsset: $navigateToAddAsset, handleScan: handleScan)
    }

    func makeUIViewController(context: Context) -> QRScannerController {
        
        let controller = QRScannerController()
        controller.delegate = context.coordinator
        return controller
    }

    func updateUIViewController(_ uiViewController: QRScannerController, context: Context) { }

}





