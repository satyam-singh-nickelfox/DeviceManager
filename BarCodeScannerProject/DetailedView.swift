//
//  DetailedView.swift
//  BarCodeScannerProject
//
//  Created by Satyam Singh on 10/07/24.
//

import Foundation
import SwiftUI

//struct DetailView: View {
//    var scannedAssetId: String
//    @StateObject private var viewModel = ScannerViewModel()
//
//    var body: some View {
//        
//        VStack {
//            Text("Scan Result")
//            Text(scannedAssetId)
//                .padding()
//           
//        }
//        Spacer()
////        .background(.white)
//        .navigationTitle("Details")
//        .onAppear {
//            viewModel.scannedAssetId = scannedAssetId
//        }
//    }
//}

struct DetailView: View {
    
    var asset: Asset

    var body: some View {
        VStack {
            Text("Asset Details")
                .font(.largeTitle)
                .padding(.bottom, 10)

            List {
                Text("Asset ID: \(asset.assetId)")
                Text("Asset Name: \(asset.assetName)")
                Text("Description: \(asset.assetDescription)")
                Text("Location: \(asset.assetLocation)")
                Text("Category: \(asset.assetCategory)")
                Text("Type: \(asset.assetType)")
                Text("Purchased On: \(asset.purchasedOn)")
                Text("Warranty Expiry Status: \(asset.warrantyExpiryStatus)")
                Text("Warranty Expires On: \(asset.warrantyExpiresOn)")
                Text("Condition: \(asset.assetCondition)")
                Text("Status: \(asset.assetStatus)")
                Text("Unavailability Reason: \(asset.unavailabilityReason)")
                Text("Employee ID: \(asset.employeeId)")
                Text("Employee Name: \(asset.employeeName)")
                Text("Employee Department: \(asset.employeeDepartment)")
                Text("Employee Subdepartment: \(asset.employeeSubdepartment)")
                Text("Last Assignment Date: \(asset.lastAssignmentDate)")
                Text("Brand: \(asset.brand)")
                Text("Serial Number: \(asset.serialNumber)")
                Text("Charger: \(asset.charger ? "Yes" : "No")")
                Text("Remarks: \(asset.remarks)")
            }
        }
    }
}

