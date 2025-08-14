import SwiftUI

struct AnimationsIOS18: View {
    let symbols : [String] = [
        "leaf.arrow.trianglehead.clockwise",
        "square.and.arrow.up",
        "accessibility"
    ]
    
    @State private var index: Int = 1
    var currentSymbol: String{
        symbols[index]
    }
    
    @State private var isBreathe: Bool = false
    @State private var isRotate: Bool = false
    @State private var isWiggle: Bool = false
    
    var body: some View {
        VStack{
            Form{
                Section("Breathe") {
                    SymbolView(text: currentSymbol)
                        .symbolEffect(.breathe, value: isBreathe)
                    Button("Breathe") {
                        isBreathe.toggle()
                    }
                }
                
                Section("Rotate") {
                    SymbolView(text: currentSymbol)
                        .symbolEffect(.rotate, value: isRotate)
                    Button("Rotate") {
                        isRotate.toggle()
                    }
                }
                
                Section("Wiggle") {
                    SymbolView(text: currentSymbol)
                        .symbolEffect(.wiggle, value: isWiggle)
                    Button("Wiggle") {
                        isWiggle.toggle()
                    }
                }
            }
            
            Button {
                index += 1
                index %= symbols.count
            } label: {
                Text("Change Symbol")
            }
        }
    }
}


struct SymbolView: View {
    let text: String
    
    var body: some View {
        Image(systemName: text)
            .imageScale(.large)
            .bold()
            .symbolRenderingMode(.multicolor)
    }
}

#Preview {
    AnimationsIOS18()
}
