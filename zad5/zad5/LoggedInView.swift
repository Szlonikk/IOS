import SwiftUI

struct LoggedInView: View {
    @EnvironmentObject var tokenStore: TokenStore
    let token: String

    var body: some View {
        VStack(spacing: 16) {
            Text("Zalogowano").font(.title2)

            Text("Token): \(token.prefix(20))...")
                .font(.footnote)
                .textSelection(.enabled)

            Button("Wyloguj") {
                tokenStore.logout()
            }
            .buttonStyle(.bordered)

            Spacer()
        }
        .padding()
    }
}


