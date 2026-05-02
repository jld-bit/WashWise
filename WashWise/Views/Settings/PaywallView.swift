import StoreKit
import SwiftUI

struct PaywallView: View {
    @EnvironmentObject private var purchaseManager: PurchaseManager

    var body: some View {
        VStack(spacing: 16) {
            Text("WashWise Premium").font(.title.bold())
            Text("Unlimited wardrobe, advanced stain guides, ad-free experience, and themes.")
                .multilineTextAlignment(.center)

            ForEach(purchaseManager.products, id: \.id) { product in
                ProductView(id: product.id)
                    .productViewStyle(.compact)
            }
        }
        .padding()
    }
}
