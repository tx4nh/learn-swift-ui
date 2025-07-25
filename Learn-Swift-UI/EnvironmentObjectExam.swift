import SwiftUI

struct EnvironmentObjectExam: View {
//    @Environment(UserViewModel.self) var userModelView: UserViewModel
    @State private var userModelView = UserViewModel()

    var body: some View {
        NavigationStack {
            Text("My name is: \(userModelView.name)")
                .font(.title)
            
            NavigationLink("Change Name") {
                UserDataView(userModelView: userModelView)
            }
        }
    }
}

struct UserDataView: View {
//    @Environment(UserViewModel.self) var userModelView: UserViewModel
    @Bindable var userModelView: UserViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text(userModelView.name)
                .font(.title2)
            
            HStack {
                Image(systemName: "pencil.line")
                TextField("Enter Your Name", text: $userModelView.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
        }
        .padding()
        .navigationTitle("Change Name")
    }
}

#Preview {
    EnvironmentObjectExam()
        .environment(UserViewModel())
}
