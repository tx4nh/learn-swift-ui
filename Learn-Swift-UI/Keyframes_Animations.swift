import SwiftUI

struct AnimationValues{
    var offsetY: CGFloat = -300
    var rotation: Angle = Angle(degrees: 0)
    var scaleX: Double = 1.0
}

struct Keyframes_Animations: View {
    var timeDuration: Double
    var body: some View {
        MyShape()
            .keyframeAnimator(initialValue: AnimationValues()) { view, value in
                view
                    .offset(y: value.offsetY)
                    .rotationEffect(value.rotation)
                    .scaleEffect(x: value.scaleX)
            } keyframes: { _ in
                KeyframeTrack(\.offsetY){
                    LinearKeyframe(-300, duration: 0.3 * timeDuration)
                    SpringKeyframe(0, duration: 0.7 * timeDuration)
                    LinearKeyframe(-100, duration: 0.1 * timeDuration)
                }
                
                KeyframeTrack(\.rotation){
                    SpringKeyframe(.degrees(0), duration: 0.5 * timeDuration)
                    SpringKeyframe(.degrees(360), duration: 0.5 * timeDuration)
                }
                
                KeyframeTrack(\.scaleX){
                    SpringKeyframe(0.8, duration: 0.5 * timeDuration)
                    SpringKeyframe(1.2, duration: 0.3 * timeDuration)
                    SpringKeyframe(1, duration: 0.2 * timeDuration)
                }
            }
    }
}

struct MyShape: View {
    var body: some View {
        Circle()
            .stroke(LinearGradient(colors: [.red, .green, .blue, .yellow, .black], startPoint: .topTrailing, endPoint: .bottomLeading), lineWidth: 20)
            .shadow(radius: 4)
            .frame(width: 100, height: 100)
    }
}

#Preview {
    Keyframes_Animations(timeDuration: 3)
}
