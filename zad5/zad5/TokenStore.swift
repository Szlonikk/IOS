
import Foundation

final class TokenStore: ObservableObject {
    @Published var token: String? {
        didSet {
            UserDefaults.standard.set(token, forKey: "auth_token")
        }
    }

    init() {
        self.token = UserDefaults.standard.string(forKey: "auth_token")
    }

    func logout() {
        token = nil
    }
}
