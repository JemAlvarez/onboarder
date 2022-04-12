//

import UIKit
import SwiftUI

@available(iOS 14, *)
public class UIOnboardingView: UIView {
    public init(frame: CGRect, pages: [OBPage]) {
        super.init(frame: frame)
        
        let onboardingView = UIHostingController(rootView: OnboardingView(pages: pages))

        onboardingView.view.frame = self.bounds
        addSubview(onboardingView.view)
        onboardingView.view.translatesAutoresizingMaskIntoConstraints = false
        onboardingView.view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        onboardingView.view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        onboardingView.view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        onboardingView.view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    public init(frame: CGRect, pages: [OBPage], configuration: OBConfiguration) {
        super.init(frame: frame)
        
        let onboardingView = UIHostingController(rootView: OnboardingView(pages: pages, configuration: configuration))

        onboardingView.view.frame = self.bounds
        addSubview(onboardingView.view)
        onboardingView.view.translatesAutoresizingMaskIntoConstraints = false
        onboardingView.view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        onboardingView.view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        onboardingView.view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        onboardingView.view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
