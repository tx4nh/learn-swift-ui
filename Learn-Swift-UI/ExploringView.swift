import SwiftUI

enum ProfileImageSize: String, CaseIterable{
    case large = "Large"
    case medium = "Medium"
    case small = "Small"
}

struct ExploringView: View {
    @State private var bgColor = Color(.sRGB, red: 1, green: 1, blue: 1)
    @State private var date = Date()
    @State private var sliderValue: Double = 0.5
    @State private var profileImagesizes: ProfileImageSize = .medium
    
    var body: some View {
        ZStack {
            bgColor.ignoresSafeArea()
//            ScrollView(.vertical, showsIndicators: false) {
//                VStack(spacing: 50){
//                    Image(systemName: "globe")
//                        .imageScale(.large)
//                        .foregroundStyle(.blue)
//                        .padding()
//                        .background(.green)
//                        .clipShape(.rect(cornerRadius: 10))
//                        .rotationEffect(Angle(degrees: 45))
//                    
//                    Text("Hello Xcode")
//                        .fontWeight(.semibold)
//                        .padding()
//                        .background(.red)
//                        .clipShape(.rect(cornerRadius: 10))
//                        .rotation3DEffect(.degrees(45), axis: (x: 1, y: 1, z: 0))
//                    
//                    Text("Hello Everyoene")
//                        .fontWeight(.semibold)
//                        .padding()
//                        .background(.blue)
//                        .clipShape(.rect(cornerRadius: 10))
//                }
//            }
                
            Form {
                Section {
                    ColorPicker(selection: $bgColor, label: {
                        Text("Select Color")
                            .padding()
                            .background(.green)
                            .clipShape(.rect(cornerRadius: 10))
                            //có để khi có background thì vẫn được radius
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.blue, lineWidth: 2)
                            }
                            
                    })
                    .padding()
                    
                    DatePicker("Select Date", selection: .constant(Date()))
                        .padding()
                    
                    Slider(value: $sliderValue, in:0...1)
                    Text("Speed is \(sliderValue)")
                } header: {
                    Text("Form")
                        .fontWeight(.semibold)
                }
                
                Section {
                    Picker("Profile Image Size", selection: $profileImagesizes) {
                        Text("Large").tag(ProfileImageSize.large)
                        Text("Medium").tag(ProfileImageSize.medium)
                        Text("Small").tag(ProfileImageSize.small)
                    }
                    
                    Button("Clear Image Cache") {}
                } header: {
                    Text("User Profiles")
                }
            }
        }
    }
}

#Preview {
    ExploringView()
}
