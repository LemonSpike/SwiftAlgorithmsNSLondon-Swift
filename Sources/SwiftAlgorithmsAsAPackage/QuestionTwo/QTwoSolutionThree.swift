//
//  QTwoSolutionThree.swift
//
//
//  Created by Pranav Kasetti on 06/03/2021.
//

import Foundation
import Algorithms

extension String {

  func phoneNumberCombinationsRecursiveBFSAlgorithms() -> [String] {

    // Initialise results.
    var results: [String] = []

    // Starting at the start index again.
    var index = self.startIndex

    // Use helper function.
    return combinationsRecursiveBFSAlgorithms(results: &results,
                                              currentIndex: &index)
  }

  // Extra inout parameter.
  func combinationsRecursiveBFSAlgorithms(
    results: inout [String],
    currentIndex: inout Index
  ) -> [String] {
    // We have generated all possible results so return these.
    guard self.isIndexValid(index: currentIndex) else {
      return results
    }

    // Get current digit.
    let digit = self[currentIndex]

    //Generate current options for current digit index.
    guard let currentOptions = LocalConstants().digitsMap[digit] else {
      return results
    }

    // Base case to initialise results.
    if results.isEmpty {
      results = currentOptions.map(Self.init)
      currentIndex = self.index(after: currentIndex)
      return combinationsRecursiveBFSAlgorithms(results: &results,
                                                currentIndex: &currentIndex)
    }

    // Generate new results for current options.
    var updated: [String] = []

    // Swift Algorithms way to avoid nested for loops.
    for (character, result) in product(currentOptions, results) {
      updated.append(result + String(character))
    }

    // Update final results array.
    results = updated

    // Increment tree level.
    currentIndex = self.index(after: currentIndex)

    // Generate all combinations for next index digit.
    return combinationsRecursiveBFSAlgorithms(results: &results,
                                              currentIndex: &currentIndex)
  }
}
