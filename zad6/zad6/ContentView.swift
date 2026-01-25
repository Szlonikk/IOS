
import SwiftUI

struct ContentView: View {
    @State private var name = ""
    @State private var cardNumber = ""
    @State private var expiry = ""
    @State private var cvv = ""
    @State private var amountText = "49.99"

    @State private var isLoading = false
    @State private var resultTitle = ""
    @State private var resultMessage = ""
    @State private var showResult = false

    private let api = PaymentAPI()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Data")) {
                    TextField("Name", text: $name)
                        .textContentType(.name)
                }

                Section(header: Text("Card")) {
                    TextField("Number", text: $cardNumber)
                        .keyboardType(.numberPad)

                    TextField("expiration (MM/YY)", text: $expiry)
                        .keyboardType(.numbersAndPunctuation)

                    SecureField("CVV", text: $cvv)
                        .keyboardType(.numberPad)
                }

                Section(header: Text("Amount")) {
                    TextField("Amount", text: $amountText)
                        .keyboardType(.decimalPad)
                }

                Section {
                    Button {
                        Task { await doPay() }
                    } label: {
                        HStack {
                            Spacer()
                            if isLoading { ProgressView() }
                            Text(isLoading ? "Loading..." : "Pay")
                            Spacer()
                        }
                    }
                    .disabled(isLoading || !isFormValid)
                }
            }
            .navigationTitle("Payment")
            .alert(resultTitle, isPresented: $showResult) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(resultMessage)
            }
        }
    }

    private var isFormValid: Bool {
        let digits = cardNumber.filter(\.isNumber)
        return !name.isEmpty &&
               digits.count >= 12 &&
               expiry.count >= 4 &&
               cvv.count >= 3 &&
               Double(amountText.replacingOccurrences(of: ",", with: ".")) != nil
    }

    private func doPay() async {
        isLoading = true
        defer { isLoading = false }

        let amount = Double(amountText.replacingOccurrences(of: ",", with: ".")) ?? 0
        let req = PaymentRequest(
            name: name,
            cardNumber: cardNumber,
            expiry: expiry,
            cvv: cvv,
            amount: amount
        )

        do {
            let res = try await api.pay(req)
            if res.status == "approved" {
                resultTitle = "approved"
                resultMessage = "\(res.message)\nPaymentId: \(res.paymentId ?? "-")"
            } else if res.status == "declined" {
                resultTitle = "declined"
                resultMessage = res.message
            } else {
                resultTitle = "error"
                resultMessage = res.message
            }
            showResult = true
        } catch {
            resultTitle = "error"
            resultMessage = error.localizedDescription
            showResult = true
        }
    }
}
