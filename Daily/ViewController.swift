//
//  ViewController.swift
//  Daily
//
//  Created by Zhi Yong Huang on 12/22/23.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a SwiftUI ContentView
        let swiftUIView = HomeView(remindersManager: RemindersManager())
        
        // Create a UIHostingController to embed SwiftUI content in UIKit
        let hostingController = UIHostingController(rootView: swiftUIView)
        
        // Add the SwiftUI view as a child view controller
        addChild(hostingController)
        
        // Add the SwiftUI view's view as a subview to your UIViewController's view
        view.addSubview(hostingController.view)
        
        // Setup constraints for the SwiftUI view
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Notify the hosting controller that it has been added
        hostingController.didMove(toParent: self)
    }
}
