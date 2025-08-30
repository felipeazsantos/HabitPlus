//
//  SplashViewRouter.swift
//  HabitPlus
//
//  Created by Felipe Azevedo Dos Santos on 30/08/25.
//

import SwiftUI

enum SplashViewRouter {
    
    static func makeSignInView() -> some View {
        let viewModel = SignInViewModel()
        return SignInView(viewModel: viewModel)
    }
}
