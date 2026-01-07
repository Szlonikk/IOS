import Foundation

struct LoginRequest: Codable {
    let username: String
    let password: String
}

struct LoginResponse: Codable {
    let access_token: String
    let token_type: String
    let expires_in: Int
}

final class APIClient {
    private let baseURL = URL(string: "http://127.0.0.1:8000")!

    func login(username: String, password: String) async throws -> LoginResponse {
        let url = baseURL.appendingPathComponent("login")
        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body = LoginRequest(username: username, password: password)
        req.httpBody = try JSONEncoder().encode(body)

        let (data, resp) = try await URLSession.shared.data(for: req)

        guard let http = resp as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        guard (200...299).contains(http.statusCode) else {
            let msg = String(data: data, encoding: .utf8) ?? "Login failed"
            throw NSError(domain: "Login", code: http.statusCode, userInfo: [NSLocalizedDescriptionKey: msg])
        }

        return try JSONDecoder().decode(LoginResponse.self, from: data)
    }
}
