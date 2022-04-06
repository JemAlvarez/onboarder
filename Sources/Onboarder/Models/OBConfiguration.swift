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
public struct OBConfiguration {
    // Misc
    public var isSkippable: Bool = true
    
    // Buttons
    public var buttonLabel: LocalizedStringKey = "Get Started!"
    public var nextButtonSFSymbol: String = "arrowtriangle.forward.circle.fill"
    public var previousButtonSFSymbol: String = "arrowtriangle.backward.circle.fill"
    
    // Text content
    public var textContentHeight: CGFloat = 300
    public var textContentBackgroundColor: Color = .gray
    public var textContentCornerRadius: CGFloat = 100
    public var textContactCorner: UIRectCorner = .topLeft
}
