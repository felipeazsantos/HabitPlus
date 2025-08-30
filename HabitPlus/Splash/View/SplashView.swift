//
//  SplashView.swift
//  HabitPlus
//
//  Created by Felipe Azevedo Dos Santos on 30/08/25.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel: SplashViewModel

    var body: some View {
        Group {
            switch viewModel.uiState {
            case .loading:
               loadingView()
            case .goToHomeScreen:
                Text("Tela principal carregada")
            case .goToSignInScreen:
                viewModel.signInView()
            case .error(let error):
                Text("Erro do servidor:\n\(error)")
            }
        }.onAppear(
            perform: viewModel.onAppear
        )
    }
}

extension SplashView {
    func loadingView(error: String? = nil) -> some View {
        ZStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(20)
                .background(Color.white)
                .ignoresSafeArea()
            
            if let error = error {
                Text("")
                    .alert(isPresented: .constant(true)) {
                        Alert(
                            title: Text("HabitPlus"),
                            message: Text(error),
                            dismissButton: .default(Text("Ok")) {
                                
                            }
                        )
                    }
            }
        }
    }
}

#Preview {
    let viewModel = SplashViewModel()
    SplashView(viewModel: viewModel)
}
