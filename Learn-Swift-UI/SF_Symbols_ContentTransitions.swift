import SwiftUI

struct SF_Symbols_ContentTransitions: View {
    @State private var clicked: Bool = false
    @State private var pauseGlobe: Bool = false
    @State private var runCount: Int = 1
    @State private var layerAnimate : Bool = true
    @State private var animationRunning: Bool = false

    var body: some View {
        VStack{
            HStack{
                Image(systemName: clicked ? "person.fill" : "globe")
                    .imageScale(.large)
                    .symbolEffectsRemoved(pauseGlobe)
                    .symbolEffect(.bounce, value: clicked)
                    .contentTransition(.symbolEffect(.replace.byLayer.downUp))
                
                Image(systemName: clicked ? "person.fill" : "globe")
                    .imageScale(.large)
                    .symbolEffectsRemoved(pauseGlobe)
                    .symbolEffect(.pulse.wholeSymbol, value: clicked)
                    .contentTransition(.symbolEffect(.replace.wholeSymbol.downUp))
                    
            }
            .padding()
            
            HStack{
                Button {
                    clicked.toggle()
                } label: {
                    Text("Click Me")
                        .font(.headline)
                        .foregroundStyle(.orange)
                        .bold()
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 5).fill(.black))
                        
                }
                
                Button {
                    pauseGlobe.toggle()
                } label: {
                    Text(pauseGlobe ? "Upgrade Globe" : "Pause Globe")
                        .font(.headline)
                        .foregroundStyle(pauseGlobe ? .red : .blue)
                        .bold()
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 5).fill(.black))
                        
                }
            }
        }
    }
}

#Preview {
    SF_Symbols_ContentTransitions()
}
