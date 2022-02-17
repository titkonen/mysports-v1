import SwiftUI

struct TrackView: View {
    var body: some View {
      VStack {
        Text("00:00")
          .font(.largeTitle)
          .fontWeight(.bold)
        HStack {
          Button(action: stopTracking) {
            Text("STOP")
          }
          .buttonStyle(RoundedButtonRed())
          Button(action: startTracking) {
            Text("START")
          }
          .buttonStyle(RoundedButtonGreen())
        }
        .padding()
      }

    }
  
  private func startTracking() {
    print("Start tracking pressed")
  }
  
  private func stopTracking() {
    print("Stop tracking pressed")
  }

  
}

struct TrackView_Previews: PreviewProvider {
    static var previews: some View {
        TrackView()
    }
}
