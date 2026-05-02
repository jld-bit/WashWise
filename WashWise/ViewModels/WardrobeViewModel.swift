import Foundation
import SwiftData

@MainActor
final class WardrobeViewModel: ObservableObject {
    func addWashEvent(for garment: Garment, method: String, context: ModelContext) {
        let event = WashEvent(method: method, garment: garment)
        garment.washHistory.append(event)
        context.insert(event)
        try? context.save()
    }
}
