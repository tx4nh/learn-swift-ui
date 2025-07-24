import SwiftUI

struct BindingExam: View {
    @State private var color1: Color = .red
    @State private var color2: Color = .green
    @State private var color3: Color = .blue
    
    var body: some View {
        ZStack{
            Color.blue.opacity(0.2).ignoresSafeArea()
            
            VStack{
                HStack{
                    RectangleView(color: color1)
                    RectangleView(color: color2)
                    RectangleView(color: color3)
                }
                
                VStack {
                    CustomColorPicker(text: "Left Box", selectedColor: $color1)
                    CustomColorPicker(text: "Center Box", selectedColor: $color2)
                    CustomColorPicker(text: "Right Box", selectedColor: $color3)
                }
                .padding()
            }
        }
    }
}

struct RectangleView: View{
    var color: Color
    var dim: CGFloat
    
    init(color: Color, dim: CGFloat = 50) {
        self.color = color
        self.dim = dim
    }
    
    var body: some View{
        RoundedRectangle(cornerRadius: 10)
            .fill(color)
            .frame(width: dim, height: dim)
    }
}

struct ColorCircle:View {
    let color: Color
    let isSelected: Bool
    
    let selectedDim: Double = 30.0
    let notSelectedDim: Double = 20.0
    
    var dim: CGFloat{
        isSelected ? selectedDim : notSelectedDim
    }
    
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: dim, height: dim)
    }
}

struct CustomColorPicker: View {
    let text: String
    @Binding var selectedColor: Color
    
    let Colors: [Color] = [
       .red,
       .green,
       .blue,
       .orange,
       .yellow, .pink, .purple, .gray, .black, .white,
       .indigo, .teal, .brown, .cyan, .green
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(text)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(Colors, id: \.self) { color in
                        ColorCircle(color: color, isSelected: color == selectedColor)
                            .onTapGesture {
                                withAnimation {
                                    selectedColor = color
                                }
                            }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 5)
            .background(Color.gray.opacity(0.3))
            .clipShape(.rect(cornerRadius: 10))
        }
        .padding()
    }
}

#Preview {
    BindingExam()
}
