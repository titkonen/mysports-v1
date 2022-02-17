import SwiftUI

struct TabBarView: View {
    var body: some View {
      TabView {
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
      .accentColor(.blue)

    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
      TabBarView()
    }
}
