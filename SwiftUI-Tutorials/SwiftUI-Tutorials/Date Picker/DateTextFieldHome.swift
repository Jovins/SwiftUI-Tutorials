import SwiftUI
import SwiftData

struct DateTextFieldHome: View {

    @State private var date: Date = .now
    
    var body: some View {
        NavigationStack {
            DateTextField(date: $date) { date in
                return date.formatted()
            }
            .navigationTitle("Date Picker")
        }
    }
}

#Preview {
    DateTextFieldHome()
}
