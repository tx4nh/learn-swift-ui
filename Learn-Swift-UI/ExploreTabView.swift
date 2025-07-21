import SwiftUI

struct ExploreTabView: View {
    var body: some View {
        TabView {
            Tab("Watch", systemImage: "play") {
                Text("Watching Film")
            }
            
            Tab("Read", systemImage: "book.pages.fill"){
                Text("Reading A Book")
            }
            
            TabSection("Hobbies") {
                Tab("Person", systemImage: "person") {
                    Text("Person View")
                }
                
                Tab("Trash", systemImage: "trash"){
                    Text("Person")
                }
            }
            
            Tab(role: .search) {
                Text("Search App")
            }
        }
        .tabViewStyle(.sidebarAdaptable)
    }
}

#Preview {
    ExploreTabView()
}
