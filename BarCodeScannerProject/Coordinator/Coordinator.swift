//
//  Coordinator.swift
//  BarCodeScannerProject
//
//  Created by Satyam Singh on 10/07/24.
//

import Foundation
import AVFoundation
import SwiftUI



class Coordinator: NSObject, QRScannerControllerDelegate {
    
    @Binding var result: String
    @Binding var isShowing: Bool
    @Binding var navigateToDetails: Bool
    @Binding var navigateToAddAsset: Bool
    var handleScan: (String) -> Void

    init(result: Binding<String>, isShowing: Binding<Bool>, navigateToDetails: Binding<Bool>, navigateToAddAsset: Binding<Bool>, handleScan: @escaping (String) -> Void) {
        _result = result
        _isShowing = isShowing
        _navigateToDetails = navigateToDetails
        _navigateToAddAsset = navigateToAddAsset
        self.handleScan = handleScan
    }

    func didFindCode(code: String) {
        result = code
        isShowing = false
        handleScan(code)
    }

    func didFail(reason: String) {
        print("Failed to scan: \(reason)")
        isShowing = false
    }
}
