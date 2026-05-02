import SwiftUI

struct ResultView: View {
    let instructions: CareInstructions

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            CareRow(icon: "drop", title: "Wash", detail: instructions.wash)
            CareRow(icon: "wind", title: "Dry", detail: instructions.dry)
            CareRow(icon: "aqi.low", title: "Bleach", detail: instructions.bleach)
            CareRow(icon: "iron", title: "Iron", detail: instructions.iron)
            CareRow(icon: "hanger", title: "Dry Clean", detail: instructions.dryClean)
        }
    }
}

struct CareRow: View {
    let icon: String
    let title: String
    let detail: String

    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: icon)
                .frame(width: 26)
            VStack(alignment: .leading) {
                Text(title).font(.headline)
                Text(detail).font(.subheadline)
            }
        }
        .padding(12)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
