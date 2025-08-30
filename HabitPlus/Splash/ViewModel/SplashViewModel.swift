//
//  SplashViewModel.swift
//  HabitPlus
//
//  Created by Felipe Azevedo Dos Santos on 30/08/25.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    
    @Published var uiState: SplashUIState = .loading
    
    func onAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.uiState = .goToSignInScreen
        })
    }
}

extension SplashViewModel {
    func signInView() -> some View {
        return SplashViewRouter.makeSignInView()
    }
}
