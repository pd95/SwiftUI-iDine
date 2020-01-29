//
//  CheckoutView.swift
//  iDine
//
//  Created by Philipp on 29.01.20.
//  Copyright © 2020 Philipp. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    static let tipAmounts = [10, 15, 20, 25, 0]

    @EnvironmentObject var order: Order
//    @State private var paymentType = 0
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1

    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
//                    ForEach(Self.paymentTypes.indices) {
//                        Text(Self.paymentTypes[$0])
                    ForEach(Self.paymentTypes, id: \.self) {
                        Text($0)
                    }
                }

                Toggle(isOn: $addLoyaltyDetails.animation()) {
                    Text("Add iDine loyalty card")
                }
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }

            }
            Section(header: Text("Add a tip?")) {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(Self.tipAmounts.indices) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("TOTAL: $100")) {
                Button("Confirm order") {
                    // place the order
                }
            }
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()

    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
