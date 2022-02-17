import SwiftUI

struct TrackView: View {
    var body: some View {
      VStack {
        Text("00:00")
        Button(action: startTracking) {
          Text("Start")
        }
        .buttonStyle(RoundedRectangleButtonStyle())
      }

    }
  
  private func startTracking() {
    print("Start tracking pressed")
  }
}

struct TrackView_Previews: PreviewProvider {
    static var previews: some View {
        TrackView()
    }
}
