import Foundation

extension Array {
  mutating func randomElement() -> Element  {
     let index = Int(arc4random_uniform(UInt32(self.count)))
     let element = self[index]
     self.remove(at: index)
     return element
  }
}
