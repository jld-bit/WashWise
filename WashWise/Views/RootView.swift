import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            NavigationStack { OnboardingView() }
                .tabItem { Label("Home", systemImage: "sparkles") }

            NavigationStack { ScanView() }
                .tabItem { Label("Scan", systemImage: "camera.viewfinder") }

            NavigationStack { WardrobeView() }
                .tabItem { Label("Wardrobe", systemImage: "tshirt") }

            NavigationStack { StainGuideView() }
                .tabItem { Label("Stains", systemImage: "drop.fill") }
        }
    }
}

#Preview {
    RootView()
}
