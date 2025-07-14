import SwiftUI

struct Person: Identifiable{
    let id = UUID()
    var name: String
    var hobby: String?
    var icon: String?
}

struct RowItem: View{
    let person: Person
    var body:some View{
        return HStack {
            VStack(alignment: .leading) {
                Text(person.name.capitalized)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                
                Text(person.hobby?.capitalized ?? "Không có sở thích")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.orange)
            }
            
            Spacer()
            
            if let hobbyIcon = person.icon {
                Image(systemName: hobbyIcon)
                    .foregroundStyle(.white)
                    .padding()
                    .background(Circle().stroke().fill(.red))
            }
        }
    }
}

struct List: View {
    let people: [Person] = [
        .init(name: "Nguyễn Văn An", hobby: "Đọc sách", icon: "book.fill"),
        .init(name: "Trần Thị Bình", hobby: "Nấu ăn", icon: "fork.knife"),
        .init(name: "Lê Minh Cường", hobby: "Chơi guitar", icon: "guitars.fill"),
        .init(name: "Phạm Thu Dung", hobby: "Vẽ tranh", icon: nil),
        .init(name: "Hoàng Quốc Huy", hobby: nil, icon: "person.fill")
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(people) { person in
                RowItem(person: person)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(.black)
            .clipShape(.rect(cornerRadius: 20))
        }
        .padding()
    }
}

#Preview {
    List()
}
