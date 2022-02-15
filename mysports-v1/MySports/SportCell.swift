import SwiftUI

struct SportCell: View {
  let sports: Sports
  static let releaseFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter
  }()

  var body: some View {
    VStack(alignment: .leading) {
      sports.sportTitle.map(Text.init)
        .font(.headline)
      HStack {
        sports.sportGenre.map(Text.init)
          .font(.caption)
        Spacer()
        sports.sportDate.map { Text(Self.releaseFormatter.string(from: $0)) }
          .font(.caption)
      }
    }
  }

}
