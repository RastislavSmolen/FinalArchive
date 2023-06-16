import SwiftUI

@main
struct FinalArchivesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView(viewModel: MainView.ViewModel(
                books:BookOject(items: [])))
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
