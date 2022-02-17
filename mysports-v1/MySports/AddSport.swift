import SwiftUI

struct AddSport: View {
  static let DefaultSportTitle = "Regular running route 10km"
  static let DefaultSportGenre = "Running"
  static let DefaultSportTime = "45min"

  @State var sportTitle = ""
  @State var sportGenre = ""
  @State var sportDate = Date()
  @State var sportTime = ""
  let onComplete: (String, String, String, Date ) -> Void

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Sport Event Title")) {
          TextField("Add Title", text: $sportTitle)
        }
        Section(header: Text("Sport Genre: Ski, run etc.")) {
          TextField("Add Genre", text: $sportGenre)
        }
        Section(header: Text("Sport duration")) {
          TextField("Ex. 45min", text: $sportTime)
        }
        Section {
          DatePicker(
            selection: $sportDate,
            displayedComponents: .date) { Text("Sport Date").foregroundColor(Color(.gray)) }
        }
        Section {
          Button(action: addMoveAction) {
            Text("Save Sport")
          }
          .buttonStyle(RoundedRectangleButtonStyle())
        }
      }
      .navigationBarTitle(Text("Mark Your Sport"), displayMode: .inline)

    }
  }

  private func addMoveAction() {
    onComplete(
      sportTitle.isEmpty ? AddSport.DefaultSportTitle : sportTitle,
      sportGenre.isEmpty ? AddSport.DefaultSportGenre : sportGenre,
      sportTime.isEmpty ? AddSport.DefaultSportTime : sportTime,
      sportDate)
  }
}
