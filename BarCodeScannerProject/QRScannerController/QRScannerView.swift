//
//  Scanner.swift
//  BarCodeScannerProject
//
//  Created by Satyam Singh on 09/07/24.
//

import Foundation
import SwiftUI
import AVFoundation
import FirebaseFirestore

import SwiftUI

struct QRScannerView: UIViewControllerRepresentable {
    @Binding var result: String
    @Binding var isShowing: Bool
    @Binding var navigateToDetails: Bool
    @Binding var navigateToAddAsset: Bool

    func makeCoordinator() -> Coordinator {
        Coordinator(scannedAssetId: $result, isShowing: $isShowing, navigateToDetails: $navigateToDetails, navigateToAddAsset: $navigateToAddAsset)
    }

    func makeUIViewController(context: Context) -> QRScannerController {
        let controller = QRScannerController()
        controller.delegate = context.coordinator
        return controller
    }

    func updateUIViewController(_ uiViewController: QRScannerController, context: Context) { }
}






