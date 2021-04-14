//
//  QOneSolutionTwo.swift
//
//
//  Created by Pranav Kasetti on 16/03/2021.
//

import Foundation
import Algorithms

struct QOneSolutionTwo {
  func fourSum(_ numbers: [Int], target: Int) -> Set<Set<Int>> {
    var candidates: Set<Set<Int>> = []
    for combination in numbers.combinations(ofCount: 4) {
      if combination.reduce(0, +) == target {
        candidates.insert(Set(combination))
      }
    }
    return candidates
  }
}
