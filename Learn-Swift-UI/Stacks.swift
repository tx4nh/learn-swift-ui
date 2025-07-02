import SwiftUI

struct Stacks: View {
    var body: some View {
        VStack(spacing: 10, content: {
            VStack{ //Vertical Stack
                Text("Hello 1")
                    .font(.title)
                Text("Hello 2")
                    .font(.title)
                Text("Hello 3")
                    .font(.title)
            }
            Spacer()
            HStack{ //Horizontal Stack
                Text("Hello 1")
                    .font(.title)
                Text("Hello 2")
                    .font(.title)
                Text("Hello 3")
                    .font(.title)
            }
            Spacer()
            ZStack{ //Z-axis Stack
                LinearGradient(colors: [.red, .blue, .green], startPoint: .topTrailing, endPoint: .bottomLeading)
                    .opacity(0.5)
                    .ignoresSafeArea()
                Text("Hello")
                    .font(.title)
            }
        })
    }
}

#Preview {
    Stacks()
}
