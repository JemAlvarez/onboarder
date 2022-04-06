import SwiftUI

public struct OBPage {
    let color: Color
    let imageName: String
    let label: (title: LocalizedStringKey, description: LocalizedStringKey)
    
    // init
    public init(color: Color, imageName: String, label: (title: LocalizedStringKey, description: LocalizedStringKey)) {
        self.color = color
        self.imageName = imageName
        self.label = label
    }
}
