import SwiftUI

struct AddSport: View {
  static let DefaultSportTitle = "Regular running route 10km"
  static let DefaultSportGenre = "Running"

  @State var sportTitle = ""
  @State var sportGenre = ""
  @State var sportDate = Date()
  let onComplete: (String, String, Date) -> Void

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Sport Event Title")) {
          TextField("Add Title", text: $sportTitle)
        }
        Section(header: Text("Sport Genre: Ski, run etc.")) {
          TextField("Add Genre", text: $sportGenre)
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
      sportDate)
  }
}
