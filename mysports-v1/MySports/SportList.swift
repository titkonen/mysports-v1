import SwiftUI

struct SportList: View {
  @FetchRequest(entity: Sports.entity(),
                sortDescriptors: [NSSortDescriptor(keyPath: \Sports.sportTitle, ascending: true)] ) var sports: FetchedResults<Sports>

  @Environment(\.managedObjectContext) var managedObjectContext
  @State var isPresented = false

  var body: some View {
    NavigationView {
      List {
        ForEach(sports, id: \.sportTitle) {
          SportCell(sports: $0)
        }
        .onDelete(perform: deleteMovie)
      }
      .sheet(isPresented: $isPresented) {
        AddSport { sportTitle, sportGenre, sportDate in
          self.addMovie(sportTitle: sportTitle, sportGenre: sportGenre, sportDate: sportDate)
          self.isPresented = false
        }
      }
      .navigationBarTitle(Text("My Sport"))
        .navigationBarItems(trailing:
          Button(action: { self.isPresented.toggle() }) {
            Image(systemName: "plus")
          }
      )
    }
  }

  func deleteMovie(at offsets: IndexSet) {
    offsets.forEach { index in
      let sport = self.sports[index]
      self.managedObjectContext.delete(sport)
    }
    saveContext()
  }

  func addMovie(sportTitle: String, sportGenre: String, sportDate: Date) {
    let newMovie = Sports(context: managedObjectContext)
    newMovie.sportTitle = sportTitle
    newMovie.sportGenre = sportGenre
    newMovie.sportDate = sportDate
    saveContext()
  }

  func saveContext() {
    do {
      try managedObjectContext.save()
    } catch {
      print("Error saving managed object context: \(error)")
    }
  }
  
}

struct MovieList_Previews: PreviewProvider {
  static var previews: some View {
    SportList()
  }
}
