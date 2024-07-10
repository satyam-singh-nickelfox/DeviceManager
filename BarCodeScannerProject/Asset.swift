//
//  Asset.swift
//  BarCodeScannerProject
//
//  Created by Satyam Singh on 10/07/24.
//

import Foundation

struct Asset {
    var assetId: String
    var assetName: String
    var assetDescription: String
    var assetLocation: String
    var assetCategory: String
    var assetType: String
    var purchasedOn: String
    var warrantyExpiryStatus: String
    var warrantyExpiresOn: String
    var assetCondition: String
    var assetStatus: String
    var unavailabilityReason: String
    var employeeId: String
    var employeeName: String
    var employeeDepartment: String
    var employeeSubdepartment: String
    var lastAssignmentDate: String
    var brand: String
    var serialNumber: String
    var charger: Bool
    var remarks: String
 

    public var json: [String: Any] {
    
        return [
            "asset_name": assetName,
            "asset_Description": assetDescription,
            "asset_Location": assetLocation,
            "asset_Category": assetCategory,
            "asset_Type": assetType,
            "purchased_On": purchasedOn,
            "warranty_Expiry_Status": warrantyExpiryStatus,
            "warranty_Expires_On": warrantyExpiresOn,
            "asset_Condition": assetCondition,
            "asset_Status": assetStatus,
            "unavailability_Reason": unavailabilityReason,
            "employee_Id": employeeId,
            "employee_Name": employeeName,
            "employee_Department": employeeDepartment,
            "employee_Subdepartment": employeeSubdepartment,
            "last_Assignment_Date": lastAssignmentDate,
            "brand": brand,
            "serial_Number": serialNumber,
            "charger": charger,
            "remarks": remarks,
        ]
    }

}


