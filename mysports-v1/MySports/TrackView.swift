import SwiftUI

struct TrackView: View {
  
  // MARK: Properties
  @State var isTimerRunning = false
  @State private var startTime =  Date()
  @State private var timerString = "0.00"
  @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  
  
  
  // MARK: View
    var body: some View {
      VStack {
        Text(self.timerString)
          .font(Font.system(size: 64, weight: .semibold, design: .monospaced))
                  .onReceive(timer) { _ in
                      if self.isTimerRunning {
                          timerString = String(format: "%.2f", (Date().timeIntervalSince( self.startTime)))
                      }
                  }
                  .onTapGesture {
                      if isTimerRunning {
                          // stop UI updates
                          self.stopTimer()
                      } else {
                          timerString = "0.00"
                          startTime = Date()
                          // start UI updates
                          self.startTimer()
                      }
                      isTimerRunning.toggle()
                  }
//                  .onAppear() {
//                      self.stopTimer()
//                  }
        HStack {
          Button(action: self.stopTimer) {
            Text("STOP")
          }
          .buttonStyle(RoundedButtonRed())
          Button(action: self.startTimer) {
              Text("START")
            }
          .buttonStyle(RoundedButtonGreen())
        }
        .padding()
      }
    } //b
  
  func startTimer() {
    print("Start time pressed")
    isTimerRunning = true
    timerString = "0.00"
    startTime = Date()
      self.timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
  }
  
  func stopTimer() {
      print("stop time pressed")
      self.timer.upstream.connect().cancel()
  }
} //->

struct TrackView_Previews: PreviewProvider {
    static var previews: some View {
        TrackView()
    }
}
