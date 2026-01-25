import Foundation

struct PaymentRequest: Codable {
    let name: String
    let cardNumber: String
    let expiry: String
    let cvv: String
    let amount: Double
}

struct PaymentResponse: Codable {
    let status: String
    let paymentId: String?
    let message: String
}

final class PaymentAPI {

    private let baseURL = URL(string: "http://127.0.0.1:5000")!

    func pay(_ req: PaymentRequest) async throws -> PaymentResponse {
        let url = baseURL.appendingPathComponent("pay")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(req)

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let http = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        if (200..<300).contains(http.statusCode) {
            return try JSONDecoder().decode(PaymentResponse.self, from: data)
        } else {
            if let decoded = try? JSONDecoder().decode(PaymentResponse.self, from: data) {
                return decoded
            }
            throw URLError(.badServerResponse)
        }
    }
}
