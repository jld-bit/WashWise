import SwiftUI
import SwiftData

@main
struct WashWiseApp: App {
    @StateObject private var purchaseManager = PurchaseManager()
    @StateObject private var reminderService = ReminderService()

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Garment.self,
            WashEvent.self
        ])

        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
            SampleDataSeeder.seedIfNeeded(container: container)
            return container
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(purchaseManager)
                .environmentObject(reminderService)
                .task {
                    await purchaseManager.loadProducts()
                    await purchaseManager.updateCustomerProductStatus()
                }
        }
        .modelContainer(sharedModelContainer)
    }
}
