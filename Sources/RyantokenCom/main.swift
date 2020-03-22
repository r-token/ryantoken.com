import Foundation
import Publish
import Plot

struct Blog: Website {
    enum SectionID: String, WebsiteSectionID {
        case blog
        case projects
        case meta
        case about
    }

    struct ItemMetadata: WebsiteItemMetadata {
        var description: String
    }

    var url = URL(string: "https://ryantoken.com")!
    var title = "ryantoken.com"
    var name = "Ryan Token"
    var description = "I'm a 💻 programmer, 🎙️podcaster, 📝 writer, 🏈🏀 sports fan, and  enthusiast."
    var language: Language { .english }
    var imagePath: Path? { "ryan-circle.png" }
    var socialMediaLinks: [SocialMediaLink] { [.location, .email, .linkedIn, .github, .twitter] }
}

try Blog().publish(withTheme: .foundation)
