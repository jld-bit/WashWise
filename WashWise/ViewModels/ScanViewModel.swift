import Foundation
import SwiftUI

@MainActor
final class ScanViewModel: ObservableObject {
    @Published var selectedImage: UIImage?
    @Published var isScanning = false
    @Published var instructions: CareInstructions?

    private let scanner = CareLabelScannerService()

    func runScan() async {
        guard let selectedImage else { return }
        isScanning = true
        instructions = await scanner.scan(image: selectedImage)
        isScanning = false
    }
}
