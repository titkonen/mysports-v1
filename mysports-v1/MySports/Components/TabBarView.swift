import SwiftUI

struct TabBarView: View {
  @AppStorage("appearance") var appearance: Appearance = .automatic
  
    var body: some View {
      TabView {
        TrackView()
          .tabItem({
            VStack {
              Image(systemName: "location.north.fill")
              Text("Track")
            }
          })
          .tag(0)
          .preferredColorScheme(appearance.getColorScheme())
        
        SportList()
          .tabItem({
            VStack {
              Image(systemName: "list.bullet")
              Text("My Sports")
            }
          })
          .tag(1)
        
        SettingsView()
            .tabItem({
              VStack {
                Image(systemName: "gear")
                Text("Settings")
              }
            })
            .tag(2)
      }
      .accentColor(.orange)

    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
      TabBarView()
    }
}
