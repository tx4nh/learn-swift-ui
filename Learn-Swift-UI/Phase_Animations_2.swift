import SwiftUI

struct Phase_Animations_2: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [.yellow, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
                .opacity(0.3)
                .ignoresSafeArea()
            
            VStack{
                Text("Animal")
                    .font(.largeTitle)
                    .bold()
                
                Image("cabypara")
                    .resizable()
                    .scaledToFit()
                    .phaseAnimator([0, 5, 10, 5]) { view, phase in
                        view
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: phase)
                            )
                    }
                    .clipShape(.rect(cornerRadius: 10))
                    .padding()
            }
        }
    }
}

#Preview {
    Phase_Animations_2()
}
