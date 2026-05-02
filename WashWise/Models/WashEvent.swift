import Foundation
import SwiftData

@Model
final class WashEvent {
    var date: Date
    var method: String
    var notes: String
    var garment: Garment?

    init(date: Date = .now, method: String, notes: String = "", garment: Garment? = nil) {
        self.date = date
        self.method = method
        self.notes = notes
        self.garment = garment
    }
}
