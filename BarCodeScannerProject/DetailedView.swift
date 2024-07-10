//
//  DetailedView.swift
//  BarCodeScannerProject
//
//  Created by Satyam Singh on 10/07/24.
//

import Foundation
import SwiftUI

struct DetailView: View {
    var scannedAssetId: String
    @StateObject private var viewModel = ScannerViewModel()

    var body: some View {
        
        VStack {
            Text("Scan Result")
            Text(scannedAssetId)
                .padding()
           
        }
        Spacer()
//        .background(.white)
        .navigationTitle("Details")
        .onAppear {
            viewModel.scannedAssetId = scannedAssetId
        }
    }
}
