import SwiftUI

struct Navigations: View {
    @State var name: String = ""
    @State var password: String = ""
    @State var age: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 2)
                    .frame(maxWidth: .infinity, maxHeight: 300.0)
                    .padding()
                    .background(Color.clear)
                
                VStack {
                    VStack(alignment: .leading){
                        Text("Enter Your Name...")
                        TextField("Dinh Tuan Anh", text: $name)
                    }
                    .padding()
                    
                    VStack(alignment: .leading){
                        Text("Enter Your Password: ")
                        SecureField("Password...", text: $password)
                    }
                    .padding()
                    
                    VStack(alignment: .leading){
                        Text("Enter Your Age...")
                        TextField("Age...", text: $age)
                            .keyboardType(.numberPad)
                    }
                    .padding()
                }
                .padding()
            }
            .padding(.bottom)
        
            NavigationLink{
                if name != "" && password != "" && age != "" {
                    ProcessView(name: name, password: password, age: age)
                } else {
                    Text("⚠️ Error: Missing Information")
                        .foregroundColor(.red)
                        .font(.headline)
                        .padding()
                        .background(Color.red.opacity(0.1))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.red, lineWidth: 2)
                        )
                }
            } label: {
                Text("Enter")
                .foregroundStyle(Color.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(20)
            }
        }
    }
}

struct ProcessView: View{
    let name, password, age: String
    
    var numbericalAge: Int {
        Int(age) ?? -1
    }
    
    var body: some View{
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.1), Color.cyan.opacity(0.3)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text("User Information")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .padding(.top, 40)
                
                VStack(spacing: 20) {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .foregroundColor(.blue)
                            .font(.title2)
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Name")
                                .font(.caption)
                                .foregroundColor(.gray)
                            Text("\(name)")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                        }
                        Spacer()
                    }
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: .gray.opacity(0.2), radius: 8, x: 0, y: 4)
                    
                    HStack {
                        Image(systemName: "lock.circle.fill")
                            .foregroundColor(.green)
                            .font(.title2)
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Password")
                                .font(.caption)
                                .foregroundColor(.gray)
                            Text("\(password)")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                        }
                        Spacer()
                    }
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: .gray.opacity(0.2), radius: 8, x: 0, y: 4)
                    
                    HStack {
                        Image(systemName: "calendar.circle.fill")
                            .foregroundColor(.orange)
                            .font(.title2)
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Age")
                                .font(.caption)
                                .foregroundColor(.gray)
                            Text("\(age)")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                        }
                        Spacer()
                    }
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: .gray.opacity(0.2), radius: 8, x: 0, y: 4)
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                        .font(.title3)
                    Text("Information saved successfully!")
                        .font(.subheadline)
                        .foregroundColor(.green)
                        .fontWeight(.medium)
                }
                .padding(15)
                .background(Color.green.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
            }
        }
    }
}

#Preview {
    Navigations()
}
