import Foundation
import Publish
import Plot

struct RyantokenCom: Website {
    enum SectionID: String, WebsiteSectionID {
        case blog
        case projects
        case meta
        case about
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // site-specific metadata
    }

    var url = URL(string: "https://ryantoken.com")!
    var name = "Ryan Token"
    var description = "I'm a 💻programmer, 🎙️podcaster, 📝writer, 🏈🏀sports fan, and  enthusiast."
    var language: Language { .english }
    var imagePath: Path? { "ryan-circle.png" }
}

try RyantokenCom().publish(withTheme: .foundation)




