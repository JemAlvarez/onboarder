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
    let isSkippable: Bool
    
    // Buttons
    let buttonLabel: LocalizedStringKey
    let nextButtonSFSymbol: String
    let previousButtonSFSymbol: String
    
    // Text content
    let textContentHeight: CGFloat
    let textContentBackgroundColor: Color
    let textContentCornerRadius: CGFloat
    let textContactCorner: UIRectCorner
    
    // init
    public init(
        isSkippable: Bool = true,
        buttonLabel: LocalizedStringKey = "Get Started!",
        nextButtonSFSymbol: String = "arrowtriangle.forward.circle.fill",
        previousButtonSFSymbol: String = "arrowtriangle.backward.circle.fill",
        textContentHeight: CGFloat = 300,
        textContentBackgroundColor: Color = .gray,
        textContentCornerRadius: CGFloat = 100,
        textContactCorner: UIRectCorner = .topLeft
    ) {
        self.isSkippable = isSkippable
        self.buttonLabel = buttonLabel
        self.nextButtonSFSymbol = nextButtonSFSymbol
        self.previousButtonSFSymbol = previousButtonSFSymbol
        self.textContentHeight = textContentHeight
        self.textContentBackgroundColor = textContentBackgroundColor
        self.textContentCornerRadius = textContentCornerRadius
        self.textContactCorner = textContactCorner
    }
}
