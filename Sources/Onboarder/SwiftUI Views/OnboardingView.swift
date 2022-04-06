//

import SwiftUI

struct OnboardingView: View {
    // Dismiss
    @Environment(\.presentationMode) var presentationMode
    // Page state
    @State var page = 0
    // Pages
    let pages: [OBPage]
    // Config
    let config: OBConfiguration
    
    var body: some View {
        mainView()
    }
}

//MARK: - Preview
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(pages: [
            OBPage(color: .red, imageName: "img", label: ("Title", "Lorem ipsum description")),
            OBPage(color: .blue, imageName: "img", label: ("Title", "Lorem ipsum description")),
            OBPage(color: .purple, imageName: "img", label: ("Title", "Lorem ipsum description")),
            OBPage(color: .green, imageName: "img", label: ("Title", "Lorem ipsum description"))
        ])
    }
}

//MARK: - Inits
extension OnboardingView {
    // Pages with defaults config
    init(pages: [OBPage]) {
        self.pages = pages
        self.config = OBConfiguration()
    }
    
    // Pages with custom config
    init(pages: [OBPage], configuration: OBConfiguration) {
        self.pages = pages
        self.config = configuration
    }
}

//MARK: - Main Views
extension OnboardingView {
    //MARK: - Main View
    func mainView() -> some View {
        ZStack {
            backgroundColorView()
            
            pagesView()
            
            navigationView()
        }
        // TODO: Disable dismiss
//        .interactiveDismissDisabled()
    }
    
    //MARK: - Navigation Buttons View
    func navigationView() -> some View {
        ZStack {
            skipButton()
            
            VStack {
                Spacer()
                
                buttons()
            }
            .padding(.horizontal, Defaults.padding)
        }
    }
    
    //MARK: - Background Color View
    func backgroundColorView() -> some View {
        pages[page].color
            .ignoresSafeArea()
    }
    
    //MARK: - Pages View
    func pagesView() -> some View {
        ZStack {
            backgroundShape()
            
            TabView(selection: $page.animation()) {
                ForEach(pages.indices, id: \.self) { i in
                    pageView(i: i)
                        .tag(i)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .ignoresSafeArea()
        }
    }
}

//MARK: - Sub Views
extension OnboardingView {
    //MARK: - Page View
    func pageView(i: Int) -> some View {
        VStack {
            image(pages[i].imageName)
            
            VStack(spacing: Defaults.padding) {
                Text(pages[i].label.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .opacity(Defaults.opacityHigh)
                    .padding(.top, Defaults.padding)
                    .padding(.top, Defaults.padding)
                
                Text(pages[i].label.description)
                    .font(.title3)
                    .opacity(Defaults.opacityMedium)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: config.textContentHeight)
            .padding(Defaults.padding)
            .padding(.bottom, Defaults.padding * 1.5)
            .offset(y: 40)
        }
    }
    
    //MARK: - Background Shape
    func backgroundShape() -> some View {
        VStack {
            Spacer()
            
            VStack{
                pagination()
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: config.textContentHeight)
            .padding(Defaults.padding)
            .padding(.bottom, Defaults.padding * 1.5)
            .background(config.textContentBackgroundColor)
            .cornerRadius(config.textContentCornerRadius, corners: config.textContactCorner)
            .offset(y: 40)
        }
    }
    
    //MARK: - Skip button
    func skipButton() -> some View {
        VStack {
            if page != pages.count - 1 && config.isSkippable {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            page = pages.count - 1
                        }
                    }) {
                        Image(systemName: "forward.end.alt.fill")
                            .foregroundColor(.primary.opacity(Defaults.opacityMedium))
                            .opacity(Defaults.opacityMedium)
                            .padding(Defaults.padding)
                    }
                }
                
                Spacer()
            }
        }
    }
    
    //MARK: - Image
    func image(_ image: String) -> some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(Defaults.padding)
    }
    
    //MARK: - Pagination
    func pagination() -> some View {
        HStack {
            ForEach(pages.indices, id: \.self) { i in
                RoundedRectangle(cornerRadius: 99, style: .continuous)
                    .fill(i == page ? pages[i].color : Color.primary.opacity(Defaults.opacityMedium))
                    .frame(width: i == page ? 45 : 9, height: 9)
            }
        }
        .opacity(Defaults.opacityHigh)
    }
    
    //MARK: - Nav Buttons
    func buttons() -> some View {
        HStack {
            if page != 0 {
                Button(action: {
                    withAnimation {
                        if page - 1 >= 0 {
                            page -= 1
                        }
                    }
                }) {
                    Image(systemName: config.previousButtonSFSymbol)
                        .font(.largeTitle)
                        .foregroundColor(pages[page].color)
                }
            }
            
            if page == pages.count - 1 {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text(config.buttonLabel)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, Defaults.padding / 2)
                        .background(pages[page].color.opacity(Defaults.opacityLow))
                        .foregroundColor(pages[page].color)
                        .cornerRadius(Defaults.cornerRadius)
                }
            } else {
                Spacer()
                
                Button(action: {
                    withAnimation {
                        if page + 1 < pages.count {
                            page += 1
                        }
                    }
                }) {
                    Image(systemName: config.nextButtonSFSymbol)
                        .font(.largeTitle)
                        .foregroundColor(pages[page].color)
                }
            }
        }
        .frame(height: 50)
    }
}
