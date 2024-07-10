//
//  ScannerViewModel.swift
//  BarCodeScannerProject
//
//  Created by Satyam Singh on 10/07/24.
//

import SwiftUI

//class ScannerViewModel: ObservableObject {
//    @Published var scanResult: String = "No QR code detected"
//    @Published var isShowScanner: Bool = false
//    @Published var navigateToDetails: Bool = false
//    @Published var isDataPresent: Bool = false
//    
//    private var firebaseManager = FirebaseManager()
//    
//    func handleScan(result: String) {
//        scanResult = result
//        checkDeviceInDatabase(assetId: result)
//    }
//    
//    private func checkDeviceInDatabase(assetId: String) {
//        firebaseManager.checkIfAssetExists(assetId: assetId) { [weak self] exists in
//            guard let self = self else { return }
//            
//            if exists {
//                // Show detail page
//            } else {
//                // Add to db
//                let newAsset = Asset(assetId: assetId,
//                      assetName: "MacBook",
//                      assetDescription: "This is a description.",
//                      assetLocation: "Location Placeholder",
//                      assetCategory: "Category Placeholder",
//                      assetType: "Type Placeholder",
//                      purchasedOn: "2024-07-10T00:00:00Z",
//                      warrantyExpiryStatus: "Active",
//                      warrantyExpiresOn: "2025-07-10T00:00:00Z",
//                      assetCondition: "New",
//                      assetStatus: "Available",
//                      unavailabilityReason: "No reason provided.",
//                      employeeId: "1",
//                      employeeName: "Employee Name Placeholder",
//                      employeeDepartment: "Department Placeholder",
//                      employeeSubdepartment: "Subdepartment Placeholder",
//                      lastAssignmentDate: "2024-06-01T00:00:00Z",
//                      brand: "Brand Placeholder",
//                      serialNumber: "SN123456789",
//                      charger: true,
//                      remarks: "Additional remarks.")
////                newAsset.json)
//                addAssetToFirestore(asset: newAsset)
//
//            }
//            self.isDataPresent = exists
//            self.navigateToDetails = true
//        }
//    }
//    
//    func addAssetToFirestore(asset: Asset) {
//        firebaseManager.addAsset(asset: asset) { [weak self] success in
//            guard let self = self else { return }
//            if success {
//                self.isDataPresent = true
//                self.navigateToDetails = true
//            }
//        }
//    }
//    
//    func resetScan() {
//        scanResult = "No QR code detected"
//        navigateToDetails = false
//        isDataPresent = false
//    }
//}




class ScannerViewModel: ObservableObject {
    @Published var scannedAssetId: String = "No QR code detected"
    @Published var isShowScanner: Bool = false
    @Published var navigateToDetails: Bool = false
    @Published var navigateToAddAsset: Bool = false
    @Published var isDataPresent: Bool = false
    
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
                self.navigateToDetails = true
            } else {
                self.navigateToAddAsset = true
            }
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
    }
}





