import Foundation
import StoreKit

@MainActor
final class PurchaseManager: ObservableObject {
    @Published var products: [Product] = []
    @Published var purchasedProductIDs = Set<String>()
    @Published var freeScanCount: Int = 0

    let productIDs = ["com.washwise.premium.monthly", "com.washwise.premium.yearly"]
    let freeScanLimit = 5
    let freeGarmentLimit = 20

    var isPremium: Bool { !purchasedProductIDs.isEmpty }

    func loadProducts() async {
        do {
            products = try await Product.products(for: productIDs)
        } catch {
            print("Failed to load products: \(error)")
        }
    }

    func updateCustomerProductStatus() async {
        for await result in Transaction.currentEntitlements {
            guard case .verified(let transaction) = result else { continue }
            purchasedProductIDs.insert(transaction.productID)
        }
    }

    func canScan() -> Bool {
        isPremium || freeScanCount < freeScanLimit
    }

    func registerScan() {
        guard !isPremium else { return }
        freeScanCount += 1
    }
}
