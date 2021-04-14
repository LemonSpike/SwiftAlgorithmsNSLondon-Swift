//
//  QTwoSolutionOne.swift
//
//
//  Created by Pranav Kasetti on 06/03/2021.
//

import Foundation

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

extension String {
  func phoneNumberCombinationsIterative() -> [String] {

    if self.isEmpty {
      return []
    }

    var digitOptions = self.reversed().compactMap { digit in
      return LocalConstants().digitsMap[digit]
    }

    var results: [String] = digitOptions.removeFirst().map {
      String.init($0)
    }
    for optionSet in digitOptions {
      var newResults: [String] = []
      results.forEach { result in
        for option in optionSet {
          newResults.append(String(option) + result)
        }
      }
      results = newResults
    }
    return results
  }
}
