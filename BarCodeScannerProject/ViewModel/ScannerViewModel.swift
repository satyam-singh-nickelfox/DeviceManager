//
//  ScannerViewModel.swift
//  BarCodeScannerProject
//
//  Created by Satyam Singh on 10/07/24.
//

import SwiftUI
import FirebaseFirestore

class ScannerViewModel: ObservableObject {
    
    @Published var scannedAssetId: String = "No QR code detected"
    @Published var isShowScanner: Bool = false
    @Published var navigateToDetails: Bool = false
    @Published var navigateToAddAsset: Bool = false
    @Published var isDataPresent: Bool = false
    @Published var assetDetails: Asset?
    
    private var firebaseManager = FirebaseManager()
    
    func handleScan(result: String) {
        scannedAssetId = result
        checkDeviceInDatabase(assetId: result)
    }
    
    private func checkDeviceInDatabase(assetId: String) {
        firebaseManager.checkIfAssetExists(assetId: assetId) { [weak self] exists in
            guard let self = self else { return }
            self.isDataPresent = exists
            if exists {
                self.fetchAssetDetails(assetId: assetId)
                self.navigateToDetails = true
            } else {
                self.navigateToAddAsset = true
            }
        }
    }
    
    private func fetchAssetDetails(assetId: String) {
        firebaseManager.fetchAssetDetails(assetId: assetId) { [weak self] asset in
            guard let self = self else { return }
            self.assetDetails = asset
            self.navigateToDetails = true
        }
    }
    
    func addAssetToFirestore(asset: Asset) {
        firebaseManager.addAsset(asset: asset) { [weak self] success in
            guard let self = self else { return }
            if success {
                self.isDataPresent = true
                self.navigateToDetails = true
            }
        }
    }
    
    func resetScan() {
        scannedAssetId = "No QR code detected"
        navigateToDetails = false
        navigateToAddAsset = false
        isDataPresent = false
        assetDetails = nil
    }
}
