import SwiftUI

struct GridsExplore: View {
    var body: some View {
        ZStack{
            Color.gray
                .opacity(0.6)
                .ignoresSafeArea()
            
            Grid{
                GridRow { //<=> 1 row in table
                    RoundedRectangle(cornerRadius: 20) //<=> 1 column
                        .fill(.blue)
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.red)
                        .gridCellColumns(2)
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.yellow)
                }
                GridRow {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.gray)
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.purple)
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.cyan)
                        .gridCellColumns(2)
                }
            }
        }
        
    }
}

#Preview {
    GridsExplore()
}
