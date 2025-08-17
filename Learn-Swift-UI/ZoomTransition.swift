import SwiftUI

struct ZoomTransition: View {
    @Namespace private var namespace
    
    var body: some View {
        NavigationStack{
            NavigationLink {
                ZStack {
                    Color.cyan.opacity(0.3).ignoresSafeArea()
                    Text("Destination View")
                        .font(.title)
                        .navigationTransition(.zoom(sourceID: "idHello", in: namespace))
                }
                
            } label: {
                Text("Hello World")
                    .font(.title)
                    .bold()
                    .fontWidth(.expanded)
                    .matchedTransitionSource(id: "idHello", in: namespace)
            }

        }
    }
}

#Preview {
    ZoomTransition()
}
