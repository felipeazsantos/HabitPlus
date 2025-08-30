//
//  SplashView.swift
//  HabitPlus
//
//  Created by Felipe Azevedo Dos Santos on 30/08/25.
//

import SwiftUI

struct SplashView: View {
    @State var state: SplashUIState = .loading

    var body: some View {
        switch state {
        case .loading:
           loadingView(error: "some error")
        case .goToHomeScreen:
            Text("Tela principal carregada")
        case .goToSignInScreen:
            Text("Tela de login")
        case .error(let error):
            Text("Erro do servidor:\n\(error)")
        }
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
    SplashView(state: .loading)
//    SplashView(state: .error("some error"))
}
