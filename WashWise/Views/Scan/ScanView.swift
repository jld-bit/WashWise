import PhotosUI
import SwiftUI

struct ScanView: View {
    @EnvironmentObject private var purchaseManager: PurchaseManager
    @StateObject private var viewModel = ScanViewModel()
    @State private var pickerItem: PhotosPickerItem?

    var body: some View {
        VStack(spacing: 16) {
            RoundedRectangle(cornerRadius: 24)
                .fill(.ultraThinMaterial)
                .frame(height: 240)
                .overlay {
                    if let image = viewModel.selectedImage {
                        Image(uiImage: image).resizable().scaledToFit()
                    } else {
                        Label("Add care label photo", systemImage: "camera")
                    }
                }

            PhotosPicker("Import Label Photo", selection: $pickerItem, matching: .images)
                .buttonStyle(.borderedProminent)

            Button("Scan Instructions") {
                Task { await viewModel.runScan(); purchaseManager.registerScan() }
            }
            .buttonStyle(.bordered)
            .disabled(viewModel.selectedImage == nil || !purchaseManager.canScan())

            if let instructions = viewModel.instructions {
                ResultView(instructions: instructions)
            }
        }
        .padding()
        .task(id: pickerItem) {
            guard let data = try? await pickerItem?.loadTransferable(type: Data.self),
                  let image = UIImage(data: data) else { return }
            viewModel.selectedImage = image
        }
    }
}
