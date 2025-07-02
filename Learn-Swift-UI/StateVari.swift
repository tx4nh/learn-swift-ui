import SwiftUI

struct StateVar: View {
    let colors1: [Color] = [.red, .blue, .green]
    let colors2: [Color] = [.black, .white, .blue]
    
    @State private var screenTap: Bool = false
    
    //computed property => use for State
    var colors: [Color] {
        screenTap ? colors2 : colors1
    }
    
    var body: some View {
        ZStack{
            LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
        }
        .onTapGesture {
            screenTap.toggle()
        }
    }
}

#Preview {
    StateVar()
}
