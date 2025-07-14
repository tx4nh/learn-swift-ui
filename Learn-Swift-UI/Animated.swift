import SwiftUI

struct Animated: View {
    var text: String = "Hello World!"
    @State private var tog: Bool = false
    var pos: CGSize {
        CGSize(width: 0, height: tog ? 100 : 500)
    }
    
    var color: Color {
        tog ? .blue  : .red
    }
    
    var bgColor: Color{
        tog ? .gray : .white
    }
    
    var body: some View {
        ZStack {
            bgColor.opacity(0.8).ignoresSafeArea()
            
            VStack {
                Text(text)
                    .font(.title)
                    .fontWeight(.semibold)
                    .offset(pos)
                    .foregroundStyle(color)
                
                Spacer()
                
                Button {
                    withAnimation(.easeInOut(duration: 1)) {
                        tog.toggle()
                    }
                } label: {
                    Text("Animated")
                        .font(.title)
                        .fontWeight(.semibold)
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

#Preview {
    Animated()
}
