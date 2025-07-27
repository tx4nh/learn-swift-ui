import SwiftUI

struct SF_Symbols_Animation: View {
    @State private var clicked: Bool = false

    var body: some View {
        VStack{
            HStack{
                Image(systemName: "globe")
                    .imageScale(.large)
                    .symbolEffect(.bounce, value: clicked)
                    .padding()
                
                Image(systemName: "house.fill")
                    .imageScale(.large)
                    .symbolEffect(.pulse, value: clicked)
                    .padding()
                
                Image(systemName: "square.stack.3d.up")
                    .imageScale(.large)
                    .symbolEffect(.variableColor.cumulative, value: clicked)
                    .foregroundStyle(clicked ? .red : .black)
                    .padding()
                
                Image(systemName: "square.stack.3d.up")
                    .imageScale(.large)
                    .symbolEffect(.variableColor.iterative, value: clicked)
                    .foregroundStyle(clicked ? .blue : .black)
                    .padding()
                
                Image(systemName: clicked ? "person.crop.circle.fill" : "bolt.horizontal.circle.fill")
                    .imageScale(.large)
                    .symbolEffect(.bounce, value: clicked)
                    .foregroundStyle(clicked ? .blue : .purple)
                    .padding()
            }
            
            Button {
                clicked.toggle()
            } label: {
                Text("Animations")
                    .font(.headline)
                    .foregroundStyle(.orange)
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.blue, lineWidth: 2)
                    }
            }

        }
    }
}

#Preview {
    SF_Symbols_Animation()
}
