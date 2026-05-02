import SwiftUI

struct OnboardingView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.pink.opacity(0.35), .blue.opacity(0.35), .purple.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 18) {
                Text("WashWise")
                    .font(.largeTitle.bold())
                Text("Snap care labels, decode instructions, and keep your wardrobe fresh with confidence.")
                    .font(.title3)
                Label("Original product design and copy", systemImage: "checkmark.seal")
                Label("Laundry reminders and care tracking", systemImage: "bell.badge")
                Label("Fashion-friendly stain guide", systemImage: "sparkles")
                Spacer()
            }
            .padding()
        }
    }
}
