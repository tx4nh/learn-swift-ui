import SwiftUI

struct BlurEffect: View {
    @State private var mainBlurEffect: Double = 10.0
    @State private var redBlurEffect: Double = 10.0
    @State private var blueBlurEffect: Double = 10.0
    
    let blendModes: [BlendMode] = [
        .plusLighter, .softLight, .normal
    ]
    @State private var blendModeIndex = 0
    var blendMode: BlendMode{
        blendModes[blendModeIndex]
    }
    
    var body: some View {
        VStack {
            ZStack{
                LinearGradient(colors: [.purple, .blue, .green, .orange], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .blur(radius: mainBlurEffect)
                
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 20))
                    .overlay {
                        Text("Cool Blur Effect")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                    }
                    .padding()
            }
            
            VStack{
                SliderTextView(value: $mainBlurEffect, min: 0, max: 30, text: "Main Blur", color: .purple)
                SliderTextView(value: $redBlurEffect, min: 0, max: 50, text: "Red Blur", color: .red)
                SliderTextView(value: $blueBlurEffect, min: 0, max: 40, text: "Blue Blur", color: .blue)
            }
            .padding()
        }
    }
}

struct SliderTextView: View{
    @Binding var value: Double
    let min: Double
    let max: Double
    let text: String
    let color: Color
    
    var body: some View{
        VStack(alignment: .leading, spacing: 0) {
            Text("\(text.capitalized): \(value.formatted())")
                .fontWeight(.semibold)
                .font(.headline)
                
            Slider(value: $value, in: min...max, step: 1)
        }
    }
}

#Preview {
    BlurEffect()
}
