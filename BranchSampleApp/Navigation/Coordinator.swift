//
//  Coordinator.swift
//  BranchSampleApp
//
//  Created by Yashwanthi Manchala on 21/01/24.
//

import Foundation
import SwiftUI

@MainActor
public final class AppCoordinator: ObservableObject {
    
    public let navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
        
        // Nav bar setup
        navigationController?.navigationBar.isHidden = true
    }
    
    private func makeHostingController(for view: some View) -> UIViewController {
        let hostingController = UIHostingController(rootView: view.environmentObject(self))
        return hostingController
    }
    
    public func push(view: some View) {
        let vc = makeHostingController(for: view)
        push(viewController: vc)
    }
    
    public func push(viewController: UIViewController) {
        DispatchQueue.main.async {
            self.navigationController!.pushViewController(viewController, animated: true)
        }
    }
    
    public func present(view: some View) {
        let vc = makeHostingController(for: view)
        present(viewController: vc)
    }
    
    public func present(viewController: UIViewController) {
        guard let windowScene = UIApplication.shared.connectedScenes.first(where: {
            $0.activationState == .foregroundActive
        }) as? UIWindowScene else { return }
        
        guard var rootVC = windowScene.keyWindow?.rootViewController else { return }
        
        while let presentedViewController = rootVC.presentedViewController {
            rootVC = presentedViewController
        }
        
        rootVC.present(viewController, animated: true)
    }
}
