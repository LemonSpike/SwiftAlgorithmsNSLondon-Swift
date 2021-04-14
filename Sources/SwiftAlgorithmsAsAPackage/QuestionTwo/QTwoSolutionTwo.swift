//
//  QTwoSolutionTwo.swift
//  
//
//  Created by Pranav Kasetti on 13/04/2021.
//

import Foundation

// Swifty way to detect valid index efficiently.
extension Collection where Element == Character {
  func isIndexValid(index: Index) -> Bool {
    return self.endIndex > index && self.startIndex <= index
  }
}

extension String {

  func phoneNumberCombinationsRecursiveDFS() -> [String] {

    // Initialize results.
    var results: [String] = []

    // Start at startIndex.
    let start = ""
    let index = self.startIndex

    // Generate all combinations.
    combinationsRecursiveDFS(results: &results,
                             currentCombination: start,
                             currentIndex: index)

    // Return all generated results.
    return results
  }

  // Traversal function.
  func combinationsRecursiveDFS(results: inout [String],
                                currentCombination: String,
                                currentIndex: Index) {
    // Detect end of traversal and append current combination.
    guard self.isIndexValid(index: currentIndex) else {
      if !currentCombination.isEmpty {
        results.append(currentCombination)
      }
      return
    }

    // Get current digit.
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
