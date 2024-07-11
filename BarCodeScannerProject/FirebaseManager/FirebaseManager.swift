//
//  FirebaseManager.swift
//  BarCodeScannerProject
//
//  Created by Satyam Singh on 10/07/24.
//

import FirebaseFirestore

class FirebaseManager {
    
    private let db = Firestore.firestore()
    
    func checkIfAssetExists(assetId: String, completion: @escaping (Bool) -> Void) {
        let docRef = db.collection("Asset").document(assetId)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    func fetchAssetDetails(assetId: String, completion: @escaping (Asset?) -> Void) {
        let docRef = db.collection("Asset").document(assetId)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists, let data = document.data() {
                let assetData = Asset(
                    assetId: data["assetId"] as? String ?? "",
                    assetName: data["asset_name"] as? String ?? "",
                    assetDescription: data["asset_Description"] as? String ?? "",
                    assetLocation: data["asset_Location"] as? String ?? "",
                    assetCategory: data["asset_Category"] as? String ?? "",
                    assetType: data["asset_Type"] as? String ?? "",
                    purchasedOn: data["purchased_On"] as? String ?? "",
                    warrantyExpiryStatus: data["warranty_Expiry_Status"] as? String ?? "",
                    warrantyExpiresOn: data["warranty_Expires_On"] as? String ?? "",
                    assetCondition: data["asset_Condition"] as? String ?? "",
                    assetStatus: data["asset_Status"] as? String ?? "",
                    unavailabilityReason: data["unavailability_Reason"] as? String ?? "",
                    employeeId: data["employee_Id"] as? String ?? "",
                    employeeName: data["employee_Name"] as? String ?? "",
                    employeeDepartment: data["employee_Department"] as? String ?? "",
                    employeeSubdepartment: data["employee_Subdepartment"] as? String ?? "",
                    lastAssignmentDate: data["last_Assignment_Date"] as? String ?? "",
                    brand: data["brand"] as? String ?? "",
                    serialNumber: data["serial_Number"] as? String ?? "",
                    charger: data["charger"] as? Bool ?? false,
                    remarks: data["remarks"] as? String ?? ""
                )
                completion(assetData)
            } else {
                completion(nil)
            }
        }
    }
    
    func addAsset(asset: Asset, completion: @escaping (Bool) -> Void) {
        let docRef = db.collection("Asset").document(asset.assetId)
        docRef.setData(asset.json) { error in
            if let error = error {
                print("Error adding asset: \(error)")
                completion(false)
            } else {
                completion(true)
            }
        }
    }
}

