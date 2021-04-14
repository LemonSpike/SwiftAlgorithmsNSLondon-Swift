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
    var results: [String] = []
    var index = self.startIndex
    return combinationsRecursiveBFSAlgorithms(results: &results,
                                              currentIndex: &index)
  }

  // Extra inout parameter.
  func combinationsRecursiveBFSAlgorithms(
    results: inout [String],
    currentIndex: inout Index
  ) -> [String] {
    guard self.isIndexValid(index: currentIndex) else {
      return results
    }

    let digit = self[currentIndex]

    guard let currentOptions = LocalConstants().digitsMap[digit] else {
      return results
    }

    if results.isEmpty {
      results = currentOptions.map(Self.init)
      currentIndex = self.index(after: currentIndex)
      return combinationsRecursiveBFSAlgorithms(results: &results,
                                                currentIndex: &currentIndex)
    }

    var updated: [String] = []
    // Swift Algorithms!
    for (character, result) in product(currentOptions, results) {
      updated.append(result + String(character))
    }
    results = updated
    currentIndex = self.index(after: currentIndex)
    return combinationsRecursiveBFSAlgorithms(results: &results,
                                              currentIndex: &currentIndex)
  }
}
