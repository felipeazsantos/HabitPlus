//
//  HabitPlusApp.swift
//  HabitPlus
//
//  Created by Felipe Azevedo Dos Santos on 30/08/25.
//

import SwiftUI

@main
struct HabitPlusApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = SplashViewModel()
            SplashView(viewModel: viewModel)
        }
    }
}
