import SwiftUI

struct LoginView: View {
    @EnvironmentObject var tokenStore: TokenStore
    private let api = APIClient()

    @State private var username = ""
    @State private var password = ""
    @State private var errorText: String?
    @State private var isLoading = false

    var body: some View {
        VStack(spacing: 16) {
            Text("Logowanie").font(.title)

            TextField("Username", text: $username)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .textFieldStyle(.roundedBorder)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

            if let errorText {
                Text(errorText).foregroundStyle(.red).font(.footnote)
            }

            Button {
                Task { await doLogin() }
            } label: {
                if isLoading { ProgressView() }
                else { Text("Zaloguj") }
            }
            .buttonStyle(.borderedProminent)
            .disabled(isLoading || username.isEmpty || password.isEmpty)

            Spacer()
        }
        .padding()
    }

    private func doLogin() async {
        errorText = nil
        isLoading = true
        defer { isLoading = false }

        do {
            let res = try await api.login(username: username, password: password)
            tokenStore.token = res.access_token
        } catch {
            errorText = error.localizedDescription
        }
    }
}
