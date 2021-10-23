//
//  AddFoodItemView.swift
//  FoodItemTracker
//

import SwiftUI

struct AddFoodItemView: View {
    @State var foodItemName: String = ""
    @State var foodItemQuantity: String = ""
    @State var foodItemShelfLife: String = ""
    @State var showAlert = false
    @ObservedObject var myFoodItems: MyFoodItems
    
    var body: some View {
        VStack(alignment: .center, spacing: 25) {
            TextField("Food Item Name", text: $foodItemName)
            
            TextField("Quantity", text: $foodItemQuantity)
                .keyboardType(.decimalPad)
            
            TextField("Shelf Life (days)", text: $foodItemShelfLife)
                .keyboardType(.decimalPad)

            Button(action: {
                myFoodItems.addFoodItem(foodItem: FoodItem(name: foodItemName, quantity: foodItemQuantity == "" ? 0 : Int(foodItemQuantity)!, shelfLife: foodItemShelfLife == "" ? 0 : Int(foodItemShelfLife)!))
                self.showAlert = true
            }, label: {
                Text("Add Set")
            })
            
        }
        .padding(.horizontal, 15)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Success"), message: Text("Food Item added to your pantry."), dismissButton: .default(Text("Ok")))
        }
        .navigationBarTitle("New Food Item", displayMode: .inline)
    }
}

struct AddFoodItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodItemView(myFoodItems: MyFoodItems())
    }
}
