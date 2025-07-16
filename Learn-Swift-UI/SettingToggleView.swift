import SwiftUI

struct SettingToggleView: View {
    @State private var enableNotificatios: Bool = false
    @State private var darkMode: Bool = false
    var body: some View {
        GroupBox {
            VStack(alignment: .leading,){
                Toggle("Notificatios", isOn: $enableNotificatios)
                Toggle("Dark Mode", isOn: $darkMode)
            }
        } label: {
            Label("Settings", systemImage: "gearshape")
        }

    }
}

#Preview {
    SettingToggleView()
}
