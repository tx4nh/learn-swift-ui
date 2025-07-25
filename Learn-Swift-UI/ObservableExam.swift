import SwiftUI
import Observation

@Observable
class SomeViewModel{
    var data1: String = "Dinh Tuan Anh"
    var data2: String = "DTA"
}

struct ObservableExam: View {
    @State var someView = SomeViewModel()
    
    var body: some View {
        VStack{
            Text(someView.data1)
            Text(someView.data2)
            
            Button {
                if someView.data1 == "Dinh Tuan Anh"{
                    someView.data1 = "Data1 is changed"
                } else {
                    someView.data1 = "Dinh Tuan Anh"
                }
            } label: {
                Text("Click")
            }

        }
    }
}

struct RandomEle: View {
    @State var randomNumer: Int = 0
    var body: some View {
        VStack{
            Text("Number random is \(randomNumer)")
            Button {
                randomNumer = (0...100).randomElement() ?? 0
            } label: {
                Text("Random Number")
            }

        }
    }
}

#Preview {
    VStack{
        ObservableExam()
        RandomEle()
    }
}
