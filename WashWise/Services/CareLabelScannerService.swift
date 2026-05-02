import Foundation
import UIKit
import Vision

struct CareInstructions {
    let wash: String
    let dry: String
    let bleach: String
    let iron: String
    let dryClean: String
}

final class CareLabelScannerService {
    func scan(image: UIImage) async -> CareInstructions {
        let ocrText = await recognizeText(from: image)
        return parseCareInstructions(from: ocrText)
    }

    private func recognizeText(from image: UIImage) async -> String {
        guard let cgImage = image.cgImage else { return "" }

        return await withCheckedContinuation { continuation in
            let request = VNRecognizeTextRequest { request, _ in
                let observations = request.results as? [VNRecognizedTextObservation] ?? []
                let text = observations.compactMap { $0.topCandidates(1).first?.string }.joined(separator: "\n")
                continuation.resume(returning: text)
            }
            request.recognitionLevel = .accurate

            let handler = VNImageRequestHandler(cgImage: cgImage)
            try? handler.perform([request])
        }
    }

    private func parseCareInstructions(from text: String) -> CareInstructions {
        let lower = text.lowercased()
        return CareInstructions(
            wash: lower.contains("cold") ? "Machine wash cold (30°C)." : "Use gentle machine wash by default.",
            dry: lower.contains("tumble") ? "Tumble dry low heat." : "Air dry flat for safer results.",
            bleach: lower.contains("non-chlorine") ? "Only non-chlorine bleach if needed." : "Avoid bleach unless label confirms.",
            iron: lower.contains("low") ? "Iron on low setting." : "Use low-medium heat with cloth barrier.",
            dryClean: lower.contains("dry clean") ? "Dry clean allowed." : "Dry clean only if fabric is delicate or structured."
        )
    }
}
