//
//  SignInView.swift
//  HabitPlus
//
//  Created by Felipe Azevedo Dos Santos on 30/08/25.
//

import SwiftUI

struct SignInView: View {
    @ObservedObject var viewModel: SignInViewModel

    @State var email: String = ""
    @State var password: String = ""

    @State var navigationHidden = true
    @State var action: Int? = 0

    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    
                    Spacer(minLength: 48)
                    
                    VStack(alignment: .center, spacing: 8) {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal, 48)

                        Text("Login")
                            .foregroundColor(.orange)
                            .font(.system(.title).bold())
                            .padding(.bottom, 8)

                        emailField
                        passwordField
                        enterButton
                        registerLink
                        
                        Text("Copyright © 2025 HabitPlus")
                            .foregroundColor(.gray)
                            .font(.system(size: 16).bold())
                            .padding(.top, 16)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 32)
            .background(Color.white)
            .navigationBarTitle("Login", displayMode: .inline)
            .navigationBarHidden(navigationHidden)
        }
        .onAppear {
            self.navigationHidden = true
        }
        .onDisappear {
            self.navigationHidden = false
        }
    }
}

extension SignInView {
    var emailField: some View {
        TextField(
            text: $email,
            label: {
                Text("E-mail")
            }
        ).border(Color.black)
    }
}

extension SignInView {
    var passwordField: some View {
        SecureField(
            text: $password,
            label: {
                Text("Senha")
            }
        ).border(Color.black)
    }
}

extension SignInView {
    var enterButton: some View {
        Button("Entrar") {

        }
    }
}

extension SignInView {
    var registerLink: some View {
        VStack {
            Text("Ainda não possui um login ativo?")
                .foregroundColor(.gray)
                .padding(.top, 48)

            ZStack {
                NavigationLink(
                    destination: Text("tela de cadastro"),
                    tag: 1,
                    selection: $action,
                    label: { EmptyView() }
                )

                Button("Realize seu cadastro") {
                    self.action = 1
                }
            }
        }
    }
}

#Preview {
    let viewModel = SignInViewModel()
    SignInView(viewModel: viewModel)
}
