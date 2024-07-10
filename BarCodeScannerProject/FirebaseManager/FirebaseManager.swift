//
//  FirebaseManager.swift
//  BarCodeScannerProject
//
//  Created by Satyam Singh on 10/07/24.
//

import Foundation
import FirebaseFirestore

class FirebaseManager {
    private var db = Firestore.firestore()

    func checkIfAssetExists(assetId: String, completion: @escaping (Bool) -> Void) {
        db.collection("Asset")
            .document(assetId)
            .getDocument { (document, error) in
                if let error = error {
                    print("Error checking document existence: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                
                if let document = document, document.exists {
                    completion(true)
                } else {
                    completion(false)
                }
            }
    }

    func addAsset(asset: Asset, completion: @escaping (Bool) -> Void) {
        db.collection("Asset")
            .document(asset.assetId)
            .setData(asset.json) { error in
                if let error = error {
                    print("Error adding asset: \(error.localizedDescription)")
                    completion(false)
                } else {
                    completion(true)
                }
            }
    }
}
