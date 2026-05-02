import SwiftUI

struct StainGuideView: View {
    let entries: [(String, String)] = [
        ("Cotton + Coffee", "Blot, rinse cold, then mild detergent soak for 20 minutes."),
        ("Silk + Makeup", "Use a silk-safe cleanser and dab gently. Avoid rubbing."),
        ("Denim + Oil", "Sprinkle baking soda first, then spot treat with dish soap.")
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(entries, id: \.0) { entry in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(entry.0).font(.headline)
                        Text(entry.1).font(.subheadline)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(LinearGradient(colors: [.mint.opacity(0.25), .cyan.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                }
            }
            .padding()
        }
        .navigationTitle("Stain Guide")
    }
}
