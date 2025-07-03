import SwiftUI

struct StateVar: View {
    let colors1: [Color] = [.red, .blue, .green]
    let colors2: [Color] = [.black, .white, .blue]
    
    @State private var screenTap: Bool = false
    
    //computed property => use for State
    var colors: [Color] {
        screenTap ? colors2 : colors1
    }
    
    var text: String {
        screenTap ? "I'm learning SwiftUI and it very complicated" : "Hello world"
    }
    
    var body: some View {
        ZStack{
            LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            Text(text)
                .font(!screenTap ? .largeTitle : .title)
                .foregroundStyle(screenTap ? .red : .white)
                .multilineTextAlignment(.center)
                .padding()
                .rotation3DEffect(.degrees(screenTap ? 0 : 360.0), axis: (x: 0, y: 1, z: 1))
            
        }
        .onTapGesture {
            withAnimation(.easeIn(duration: 0.5)) {
                screenTap.toggle()
            }
        }
    }
}

#Preview {
    StateVar()
}
