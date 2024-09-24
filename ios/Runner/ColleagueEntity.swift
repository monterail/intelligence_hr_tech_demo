import CoreSpotlight
import AppIntents

struct ColleagueEntity: AppEntity {
  static var defaultQuery: ColleagueQuery = ColleagueQuery()
  static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "Colleague")
  
  var displayRepresentation: DisplayRepresentation {
    DisplayRepresentation(stringLiteral: representation)
  }
  
  let id: String
  let representation: String
}

extension ColleagueEntity: IndexedEntity {
  var attributeSet: CSSearchableItemAttributeSet {
    let attributes = CSSearchableItemAttributeSet()
    attributes.displayName = self.representation
    return attributes
  }
}
