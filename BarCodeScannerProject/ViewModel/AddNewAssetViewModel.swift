//
//  AddNewAssetViewModel.swift
//  BarCodeScannerProject
//
//  Created by Satyam Singh on 10/07/24.
//

import Foundation
import SwiftUI

class AddAssetViewModel: ObservableObject {
    @Published var assetDataResponse = Asset(
        assetId: "",
        assetName: "",
        assetDescription: "",
        assetLocation: "",
        assetCategory: "",
        assetType: "",
        purchasedOn: "",
        warrantyExpiryStatus: "",
        warrantyExpiresOn: "",
        assetCondition: "",
        assetStatus: "",
        unavailabilityReason: "",
        employeeId: "",
        employeeName: "",
        employeeDepartment: "",
        employeeSubdepartment: "",
        lastAssignmentDate: "",
        brand: "",
        serialNumber: "",
        charger: false,
        remarks: ""
    )
    
    private var firebaseManager = FirebaseManager()
    
    func addAssetToFirestore() {
        firebaseManager.addAsset(asset: assetDataResponse) { success in
            if success {
                print("Asset added successfully!")
            } else {
                print("Failed to add asset.")
            }
        }
    }
}
