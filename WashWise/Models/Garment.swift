import Foundation
import SwiftData

@Model
final class Garment {
    @Attribute(.unique) var id: UUID
    var name: String
    var fabricType: String
    var careNotes: String
    var imageData: Data?
    var createdAt: Date
    var washInstruction: String
    var dryInstruction: String
    var bleachInstruction: String
    var ironInstruction: String
    var dryCleanInstruction: String
    @Relationship(deleteRule: .cascade, inverse: \WashEvent.garment) var washHistory: [WashEvent]

    init(
        id: UUID = UUID(),
        name: String,
        fabricType: String,
        careNotes: String,
        imageData: Data? = nil,
        createdAt: Date = .now,
        washInstruction: String,
        dryInstruction: String,
        bleachInstruction: String,
        ironInstruction: String,
        dryCleanInstruction: String,
        washHistory: [WashEvent] = []
    ) {
        self.id = id
        self.name = name
        self.fabricType = fabricType
        self.careNotes = careNotes
        self.imageData = imageData
        self.createdAt = createdAt
        self.washInstruction = washInstruction
        self.dryInstruction = dryInstruction
        self.bleachInstruction = bleachInstruction
        self.ironInstruction = ironInstruction
        self.dryCleanInstruction = dryCleanInstruction
        self.washHistory = washHistory
    }
}
