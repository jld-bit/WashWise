import SwiftData
import SwiftUI

struct WardrobeView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Garment.createdAt, order: .reverse) private var garments: [Garment]

    var body: some View {
        List {
            ForEach(garments) { garment in
                VStack(alignment: .leading, spacing: 6) {
                    Text(garment.name).font(.headline)
                    Text(garment.fabricType).font(.subheadline)
                    Text(garment.careNotes).font(.caption)
                }
            }
        }
        .navigationTitle("My Wardrobe")
    }
}

#Preview {
    WardrobeView()
}
