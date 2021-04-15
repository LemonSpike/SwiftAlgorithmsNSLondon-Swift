//
//  QTwoSolutionOne.swift
//
//
//  Created by Pranav Kasetti on 06/03/2021.
//

import Foundation

// Avoiding static let heap allocation for performance tests.
struct LocalConstants {
  let digitsMap: [Character: [Character]] = {
    var result: [Character: [Character]] = [:]
    result["2"] = ["a", "b", "c"]
    result["3"] = ["d", "e", "f"]
    result["4"] = ["g", "h", "i"]
    result["5"] = ["j", "k", "l"]
    result["6"] = ["m", "n", "o"]
    result["7"] = ["p", "q", "r", "s"]
    result["8"] = ["t", "u", "v"]
    result["9"] = ["w", "x", "y", "z"]
    return result
  }()
}

// Instead of struct.
extension String {

  func phoneNumberCombinationsIterative() -> [String] {
    // Edge case.
    if self.isEmpty {
      return []
    }

    // Generate digit mappings.
    var digitOptions = self.reversed().compactMap { digit in
      return LocalConstants().digitsMap[digit]
    }

    // Create results for storing all combinations.
    var results: [String] = digitOptions.removeFirst().map {
      String.init($0)
    }

    // Loop through each option set in the digit mappings.
    for optionSet in digitOptions {

      // We need to generate new results.
      var newResults: [String] = []

      // Append new results for each option in the current option set.
      results.forEach { result in
        for option in optionSet {
          newResults.append(String(option) + result)
        }
      }

      // Update final results.
      results = newResults
    }

    // Return results.
    return results
  }
}
