import Foundation
import Publish
import Plot

// This type acts as the configuration for your website.
struct RyantokenCom: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case blog
        case projects
        case meta
        case about
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    var url = URL(string: "https://ryantoken.com")!
    var name = "Ryan Token"
    var description = "I'm a 💻programmer, 🎙️podcaster, 📝writer, 🏈🏀sports fan, and  enthusiast."
    var language: Language { .english }
    var imagePath: Path? { "ryan-circle.png" }
}

// This will generate your website using the built-in Foundation theme:
try RyantokenCom().publish(withTheme: .foundation)
