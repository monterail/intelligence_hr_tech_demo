import AppIntents
import intelligence

struct ColleagueQuery: EntityQuery {
  func entities(for identifiers: [String]) async throws -> [ColleagueEntity] {
    return IntelligencePlugin.storage.get(for: identifiers).map() { item in
      return ColleagueEntity(
        id: item.id,
        representation: item.representation
      )
    }
  }
  
  func suggestedEntities() async throws -> [ColleagueEntity] {
    return IntelligencePlugin.storage.get().map() { item in
      return ColleagueEntity(
        id: item.id,
        representation: item.representation
      )
    }
  }
}

extension ColleagueQuery: EnumerableEntityQuery {
  func allEntities() async throws -> [ColleagueEntity] {
    return IntelligencePlugin.storage.get().map() { item in
      return ColleagueEntity(
        id: item.id,
        representation: item.representation
      )
    }
  }
}

