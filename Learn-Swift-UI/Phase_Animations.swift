import SwiftUI

struct Phase_Animations: View {
    @State var animateMe: Bool = false
    
    let phases: [AnimateProperties] = [
        .init(
            color: .red,
            bgColor: .black,
            font: .largeTitle,
            fontWeight: .semibold,
            cornerRadius: 20,
            xScale: 1,
            yScale: 1.5,
            offsetY: 0,
            rotate: 30
        ),
        .init(
            color: .blue,
            bgColor: .gray,
            font: .body,
            fontWeight: .thin,
            cornerRadius: 5,
            xScale: 1,
            yScale: 1.5,
            offsetY: 50,
            rotate: 60
        ),
    ]
    
    var body: some View {
        VStack{
            Spacer()
            Text("Hello World")
                .phaseAnimator(phases, trigger: animateMe, content: { view, phase in
                    view
                        .font(phase.font)
                        .foregroundStyle(phase.color)
                        .fontWeight(phase.fontWeight)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: phase.cornerRadius).fill(phase.bgColor))
                        .scaleEffect(x: phase.xScale, y: phase.yScale)
                        .offset(y: phase.offsetY)
                        .rotation3DEffect(Angle(degrees: phase.rotate), axis: (x: 1, y: 0, z: 0))
                })
            
            Spacer()
            
            Button {
                animateMe.toggle()
            } label: {
                Text(!animateMe ? "Play" : "Stop")
            }

        }
    }
}

struct AnimateProperties: Equatable {
    let color: Color
    let bgColor: Color
    let font: Font
    let fontWeight: Font.Weight
    let cornerRadius: CGFloat
    let xScale: CGFloat
    let yScale: CGFloat
    let offsetY: CGFloat
    let rotate: Double
}

#Preview {
    Phase_Animations()
}
