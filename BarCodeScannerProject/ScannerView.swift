//
//  ScannerView.swift
//  BarCodeScannerProject
//
//  Created by Satyam Singh on 09/07/24.
//

import SwiftUI
import CodeScanner

import SwiftUI

struct ScannerView: View {
    
    @StateObject private var viewModel = ScannerViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Spacer()
                    scannerButton
                    Spacer()
                }
                .navigationTitle("Scanner")
                .navigationBarHidden(true)
                if let assetDetails = viewModel.assetDetails {
                    NavigationLink(destination: DetailView(asset: assetDetails), isActive: $viewModel.navigateToDetails) {
                        EmptyView()
                    }
                }
                
                NavigationLink(destination: AddAssetView(assetId: viewModel.scannedAssetId), isActive: $viewModel.navigateToAddAsset) {
                    EmptyView()
                }
            }
        }
    }
    
    var scannerButton: some View {
        VStack {
            Button {
                // Reset the scan result
                viewModel.resetScan()
                viewModel.isShowScanner = true
                print("Tapped the Scanner Button")
            } label: {
                ZStack {
                    Color.red.opacity(0.4)
                    Image(systemName: "barcode.viewfinder")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 45, height: 40)
                        .foregroundStyle(Color.black)
                }
                .frame(width: 120, height: 89)
                .shadow(color: Color.black.opacity(0.2), radius: 4)
            }
            .cornerRadius(20)
        }
        .fullScreenCover(isPresented: $viewModel.isShowScanner) {
            QRScannerView(result: $viewModel.scannedAssetId, isShowing: $viewModel.isShowScanner, navigateToDetails: $viewModel.navigateToDetails, navigateToAddAsset: $viewModel.navigateToAddAsset, handleScan: viewModel.handleScan)
        }
    }
}

#Preview {
    ScannerView()
}
