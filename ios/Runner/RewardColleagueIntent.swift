import AppIntents
import intelligence

struct RewardColleagueIntent: AppIntent {
  static var title: LocalizedStringResource = "Reward colleague"
  static var openAppWhenRun: Bool = true
    
  @Parameter(title: "Colleague")
  var target: ColleagueEntity
  
  @Parameter(title: "Points")
  var points: Int?
  
  @MainActor
  func perform() async throws -> some IntentResult {
    let dialog = IntentDialog("How many points do you want to award?")
    
    let pointsRetry = try await $points.requestDisambiguation(among: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], dialog: dialog)
    
    IntelligencePlugin.notifier.push("\(target.id)?points=\(pointsRetry)")
    return .result()
  }
  
  static var parameterSummary: some ParameterSummary {
    Summary("Reward \(\.$target)")
  }
}


struct AppShortcuts: AppShortcutsProvider {
  static var appShortcuts: [AppShortcut] {
    AppShortcut(
      intent: RewardColleagueIntent(),
      phrases: [
        "Reward \(\.$target) in \(.applicationName)"
      ]
    )
  }
}

