//
//  AddNewAssetView.swift
//  BarCodeScannerProject
//
//  Created by Satyam Singh on 10/07/24.
//

import Foundation
import SwiftUI

struct AddAssetView: View {
    @StateObject private var viewModel = AddAssetViewModel()
    var assetId: String
    
    var body: some View {
        VStack{
        Form {
            Section(header: Text("Asset Information")) {
                assetDetailsTextField
            }
            
            Section(header: Text("Employee Information")) {
                assetNameTextField
            }
            
        }
        
        
        .navigationTitle("Add Asset")
        .onAppear {
            viewModel.assetDataResponse.assetId = assetId
        }
        
        addDataButton
    }
    }
    
    var assetNameTextField: some View {
        VStack {
            
            
            TextField("Employee ID", text: $viewModel.assetDataResponse.employeeId)
            TextField("Employee Name", text: $viewModel.assetDataResponse.employeeName)
            TextField("Department", text: $viewModel.assetDataResponse.employeeDepartment)
            TextField("Subdepartment", text: $viewModel.assetDataResponse.employeeSubdepartment)
            TextField("Last Assignment Date", text: $viewModel.assetDataResponse.lastAssignmentDate)
        }
    }
    
    var assetDetailsTextField: some View {
        VStack {
            TextField("Asset Name", text: $viewModel.assetDataResponse.assetName)
            TextField("Description", text: $viewModel.assetDataResponse.assetDescription)
            TextField("Location", text: $viewModel.assetDataResponse.assetLocation)
            TextField("Category", text: $viewModel.assetDataResponse.assetCategory)
            TextField("Brand", text: $viewModel.assetDataResponse.brand)
            TextField("Serial Number", text: $viewModel.assetDataResponse.serialNumber)
            TextField("Remarks", text: $viewModel.assetDataResponse.remarks)
            TextField("Type", text: $viewModel.assetDataResponse.assetType)
            TextField("Purchase Date", text: $viewModel.assetDataResponse.purchasedOn)
            TextField("Warranty Expiry Status", text: $viewModel.assetDataResponse.warrantyExpiryStatus)
            TextField("Warranty Expiry Date", text: $viewModel.assetDataResponse.warrantyExpiresOn)
            TextField("Condition", text: $viewModel.assetDataResponse.assetCondition)
            Toggle("Charger", isOn: $viewModel.assetDataResponse.charger)
            TextField("Status", text: $viewModel.assetDataResponse.assetStatus)
            TextField("Unavailability Reason", text: $viewModel.assetDataResponse.unavailabilityReason)
        }
    }
    
    var addDataButton: some View {
        ZStack {
            VStack {
                Button("Add Asset to Firestore") {
                    viewModel.addAssetToFirestore()
                }

            }
        }
    }
}

struct AddAssetView_Previews: PreviewProvider {
    static var previews: some View {
        AddAssetView(assetId: "SampleID")
    }
}
