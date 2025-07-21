import SwiftUI

struct MyImageView: View {
    let name: String
    let maxWidth: CGFloat?
    
    init(name: String, maxWidth: CGFloat? = nil) {
        self.name = name
        self.maxWidth = maxWidth
    }
    
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
            .clipShape(.rect(cornerRadius: 20))
            .padding()
            .frame(maxWidth: maxWidth)
    }
}

struct ScrollViewExam: View{
    let images: [String] = [
        "monkey",
        "cabypara",
        "cong",
        "nai"
    ]
    
    var body: some View {
        ScrollView(.horizontal){
            HStack(spacing: 10){
                ForEach(images, id: \.self) { image in
                    ZStack{
                        MyImageView(name: image)
                            .scrollTransition(axis: .horizontal) { content, phase in
                                let value = phase.value
                                
                                let opacity = value + 1
                                
                                return content.opacity(opacity)
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollViewExam()
}
