
import SwiftUI

struct ContentView: View {
    @StateObject private var tokenStore = TokenStore()

    var body: some View {
        Group {
            if let token = tokenStore.token {
                LoggedInView(token: token)
                    .environmentObject(tokenStore)
            } else {
                LoginView()
                    .environmentObject(tokenStore)
            }
        }
    }
}
