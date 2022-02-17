import SwiftUI

struct SettingsView: View {
  // MARK: Properties
  @State var dailyReminderEnabled = false
  @State var dailyReminderTime = Date(timeIntervalSince1970: 0)
  //@State var appearance: Appearance = .automatic
  @AppStorage("appearance") var appearance: Appearance = .automatic
  
  // MARK: View
    var body: some View {
      List {
        Text("Settings")
          .font(.largeTitle)
          .padding(.bottom, 8)
        Section(header: Text("Appearance")) {
          VStack(alignment: .leading) {
            Picker("", selection: $appearance) {
              ForEach(Appearance.allCases) { appearance in
                Text(appearance.name).tag(appearance)
              }          }
            .pickerStyle(SegmentedPickerStyle())
          }
        }


        Section(header: Text("Notifications")) {
          HStack {
            if #available(iOS 14.0, *) {
              Toggle("Daily Reminder", isOn: $dailyReminderEnabled)
                .onChange(
                  of: dailyReminderEnabled,
                  perform: { _ in configureNotification() }
                )
            } else {
              // Fallback on earlier versions
            }


            if #available(iOS 14.0, *) {
              DatePicker(
                "",
                selection: $dailyReminderTime,
                displayedComponents: .hourAndMinute
              )
                .disabled(dailyReminderEnabled == false)
                .onChange(
                  of: dailyReminderTime,
                  perform: { _ in configureNotification() }
                )
            } else {
              // Fallback on earlier versions
            }


          }

        }

        
      }

    } //b
  
  func configureNotification() {
    if dailyReminderEnabled {
      LocalNotifications.shared.createReminder(
        time: dailyReminderTime)
    } else {
      LocalNotifications.shared.deleteReminder()
    }
  }

  
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
