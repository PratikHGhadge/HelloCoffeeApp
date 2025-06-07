import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var model: CoffeeModel
    
    private func populateOrders() async {
        do {
            try await model.populateOrders()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        VStack {
            List(model.orders) { order in
                OrderCellView(order: order)
            }
        }.task {
            await populateOrders()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(CoffeeModel(webService: WebService()))
    }
}
