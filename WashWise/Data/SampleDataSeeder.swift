import Foundation
import SwiftData

enum SampleDataSeeder {
    static func seedIfNeeded(container: ModelContainer) {
        let context = ModelContext(container)
        let descriptor = FetchDescriptor<Garment>()
        let count = (try? context.fetchCount(descriptor)) ?? 0
        guard count == 0 else { return }

        let tee = Garment(
            name: "Weekend Cotton Tee",
            fabricType: "100% Cotton",
            careNotes: "Wash inside-out to protect color.",
            washInstruction: "Machine wash cold",
            dryInstruction: "Tumble dry low",
            bleachInstruction: "Do not bleach",
            ironInstruction: "Iron low",
            dryCleanInstruction: "Do not dry clean"
        )

        let blouse = Garment(
            name: "Silk Evening Blouse",
            fabricType: "Silk Blend",
            careNotes: "Use garment bag and avoid wringing.",
            washInstruction: "Hand wash cold",
            dryInstruction: "Hang dry away from sunlight",
            bleachInstruction: "No bleach",
            ironInstruction: "Steam only, low",
            dryCleanInstruction: "Dry clean optional"
        )

        context.insert(tee)
        context.insert(blouse)
        try? context.save()
    }
}
