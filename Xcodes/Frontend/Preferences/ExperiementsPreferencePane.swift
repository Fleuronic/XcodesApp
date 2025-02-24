import AppleAPI
import SwiftUI
import Path

struct ExperimentsPreferencePane: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            GroupBox(label: Text("Faster Unxip")) {
                VStack(alignment: .leading) {
                    Toggle(
                        "When unxipping, use experiment",
                        isOn: $appState.unxipExperiment
                    )
                    AttributedText(unxipFootnote)
                }
                .fixedSize(horizontal: false, vertical: true)
            }
            .groupBoxStyle(PreferencesGroupBoxStyle())
            
            Divider()
        }
        .frame(width: 500)
    }
    
    private var unxipFootnote: NSAttributedString {
        let string = """
        Thanks to @_saagarjha, this experiment can increase unxipping
        speed by up to 70% for some systems. 
        
        More information on how this is accomplished can be seen
        on the unxip repo - https://github.com/saagarjha/unxip
        """
        let attributedString = NSMutableAttributedString(
            string: string,
            attributes: [
                .font: NSFont.preferredFont(forTextStyle: .footnote, options: [:]),
                .foregroundColor: NSColor.labelColor
            ]
        )
        attributedString.addAttribute(.link, value: URL(string: "https://twitter.com/_saagarjha")!, range: NSRange(string.range(of: "@_saagarjha")!, in: string))
        attributedString.addAttribute(.link, value: URL(string: "https://github.com/saagarjha/unxip")!, range: NSRange(string.range(of: "https://github.com/saagarjha/unxip")!, in: string))
        return attributedString
    }
}

struct ExperimentsPreferencePane_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ExperimentsPreferencePane()
                .environmentObject(AppState())
        }
    }
}
