//
//  Coordinator.swift
//  BarCodeScannerProject
//
//  Created by Satyam Singh on 10/07/24.
//

import Foundation
import Foundation
import AVFoundation
import SwiftUI

class Coordinator: NSObject, AVCaptureMetadataOutputObjectsDelegate {
    @Binding var scannedAssetId: String
    @Binding var isShowing: Bool
    @Binding var navigateToDetails: Bool
    @Binding var navigateToAddAsset: Bool

    init(scannedAssetId: Binding<String>, isShowing: Binding<Bool>, navigateToDetails: Binding<Bool>, navigateToAddAsset: Binding<Bool>) {
        self._scannedAssetId = scannedAssetId
        self._isShowing = isShowing
        self._navigateToDetails = navigateToDetails
        self._navigateToAddAsset = navigateToAddAsset
    }

    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            scannedAssetId = stringValue
            isShowing = false
            navigateToDetails = false
            navigateToAddAsset = true
        }
    }
}
