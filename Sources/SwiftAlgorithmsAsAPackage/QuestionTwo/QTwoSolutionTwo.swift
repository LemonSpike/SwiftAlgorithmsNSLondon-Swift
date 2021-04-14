//
//  QTwoSolutionTwo.swift
//  
//
//  Created by Pranav Kasetti on 13/04/2021.
//

import Foundation

// Swifty!
extension Collection where Element == Character {
  func isIndexValid(index: Index) -> Bool {
    return self.endIndex > index && self.startIndex <= index
  }
}

extension String { // Instead of struct.

  func phoneNumberCombinationsRecursiveDFS() -> [String] {
    var results: [String] = []
    let start = ""
    let index = self.startIndex
    combinationsRecursiveDFS(results: &results, currentCombination: start,
                             currentIndex: index)
    return results
  }

  func combinationsRecursiveDFS(results: inout [String],
                                currentCombination: String,
                                currentIndex: Index) {
    // Detect end of traversal.
    guard self.isIndexValid(index: currentIndex) else {
      if !currentCombination.isEmpty {
        results.append(currentCombination)
      }
      return
    }

    let digit = self[currentIndex]

    // Get letters for current digit.
    guard let currentOptions = LocalConstants().digitsMap[digit] else {
      return
    }

    for character in currentOptions {
      // Increment level.
      let currentIndex = self.index(after: currentIndex)
      // Update current combination.
      let currentCombination = currentCombination + String(character)
      // Search next layer of tree.
      combinationsRecursiveDFS(results: &results,
                               currentCombination: currentCombination,
                               currentIndex: currentIndex)
    }
  }
}
