import SwiftUI

struct PreferencesView: View {
    private enum Tabs: Hashable {
        case general, updates, advanced, experiment
    }
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        TabView {
            GeneralPreferencePane()
                .environmentObject(appState)
                .tabItem {
                    Label("General", systemImage: "gearshape")
                }
                .tag(Tabs.general)
            UpdatesPreferencePane()
                .tabItem {
                    Label("Updates", systemImage: "arrow.triangle.2.circlepath.circle")
                }
                .tag(Tabs.updates)
            AdvancedPreferencePane()
                .environmentObject(appState)
                .tabItem {
                    Label("Advanced", systemImage: "gearshape.2")
                }
                .tag(Tabs.advanced)
            ExperimentsPreferencePane()
                .tabItem {
                    Label("Experiments", systemImage: "testtube.2")
                }
                .tag(Tabs.experiment)
        }
        .padding(20)
    }
}
