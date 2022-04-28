# Onboarder
> Create a beautiful Onabording for your iOS/iPadOS apps in just a few minutes.

## Preview

<img src="./Assets/onboarding.gif" height="450" />

## Installation

1. In XCode 12 go to `File -> Swift Packages -> Add Package Dependency` or in XCode 13 `File -> Add Packages`
2. Paste in the repo's url: ```https://github.com/JemAlvarez/onboarder``` and select by version.

## SwiftUI usage example

```swift
import Onboarder
import SwiftUI

struct OnboardingExample: View {
	let pages: [OBPage] = [
		OBPage(color: .blue, imageName: "img", label: ("Page 1", "First page")),
		OBPage(color: .red, imageName: "img", label: ("Page 2", "Second page"))
	]

	let configuration: OBConfiguration = OBConfiguration(textContentBackgroundColor: Color("darkBlack"))

	var body: some View {
		// With custom configuration
		OnboardingView(pages: pages, config: configuration, dismiss: yourDismissFunc)

		// Without default configuration
		OnboardingView(pages: pages, dismiss: yourDismissFunc)
	}
}
```

## UIKit usage example

```swift
import UIKit
import Onboarder
import SwiftUI

class ViewController: UIViewController {
	let pages: [OBPage] = [
		OBPage(color: .blue, imageName: "img", label: ("Page 1", "First page")),
		OBPage(color: .red, imageName: "img", label: ("Page 2", "Second page"))
	]
    
	override func viewDidLoad() {
		super.viewDidLoad()
        
		// Without default configuration
		let onboarding = UIOnboardingView(frame: .zero, pages: pages, dismiss: yourDismissFunc)

		// With custom configuration
		let config = OBConfiguration(isSkippable: false)
		let onboardingWithConfig = UIOnboardingView(frame: .zero, pages: pages, configuration: config, dismiss: yourDismissFunc)
        
		// Add onboarding view to viewController
		view.addSubview(onboarding)
		// Add onboarding view constrints
		onboarding.translatesAutoresizingMaskIntoConstraints = false
		onboarding.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		onboarding.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		onboarding.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		onboarding.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
	}
}

```

## Configuration

```swift
// Make your onboarding skippable or not.
isSkippable: Bool = true,
// Change the label for the last page button (Localizable).
buttonLabel: LocalizedStringKey = "Get Started!",
// SF Symbol for next button.
nextButtonSFSymbol: String = "arrowtriangle.forward.circle.fill",
// SF Symbol for previous button.
previousButtonSFSymbol: String = "arrowtriangle.backward.circle.fill",
// Height for the text container.
textContentHeight: CGFloat = 300,
// Background for the text container.
textContentBackgroundColor: Color = .gray,
// Radius for the text container.
textContentCornerRadius: CGFloat = 100,
// Corners to round for the text container.
textContactCorner: UIRectCorner = .topLeft
```

## Notes

* Support `iOS` & `iPadOS` version `14` and above

## Meta

Jem Alvarez – [@official_JemAl](https://twitter.com/official_JemAl) – contact@jemalvarez.com

Distributed under the MIT license. See ``LICENSE`` for more information.

[Onboarder](https://github.com/JemAlvarez/onboarder)
