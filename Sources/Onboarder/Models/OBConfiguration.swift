import SwiftUI

/// Configure your onboarding.
///
/// - Warning: Pages cannot be an empty array, will result in fatal error due to index out of bounds (intended).
///
/// **Parameters**
/// * isSkippable -> Make your onboarding skippable or not.
/// * buttonLabel -> Make your onboarding skippable or not.
/// * nextButtonSFSymbol -> Make your onboarding skippable or not.
/// * previousButtonSFSymbol -> Make your onboarding skippable or not.
/// * textContentHeight -> Make your onboarding skippable or not.
/// * textContentBackgroundColor -> Make your onboarding skippable or not.
/// * textContentCornerRadius -> Make your onboarding skippable or not.
/// * textContactCorner -> Make your onboarding skippable or not.
///
struct OBConfiguration {
    // Misc
    var isSkippable: Bool = true
    
    // Buttons
    var buttonLabel: LocalizedStringKey = "Get Started!"
    var nextButtonSFSymbol: String = "arrowtriangle.forward.circle.fill"
    var previousButtonSFSymbol: String = "arrowtriangle.backward.circle.fill"
    
    // Text content
    var textContentHeight: CGFloat = 300
    var textContentBackgroundColor: Color = .gray
    var textContentCornerRadius: CGFloat = 100
    var textContactCorner: UIRectCorner = .topLeft
}
