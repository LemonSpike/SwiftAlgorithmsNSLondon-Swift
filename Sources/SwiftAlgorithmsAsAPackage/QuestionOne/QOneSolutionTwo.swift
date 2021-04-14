//
//  QOneSolutionTwo.swift
//
//
//  Created by Pranav Kasetti on 16/03/2021.
//

import Foundation
import Algorithms

extension Array where Element: FixedWidthInteger {
  func fourSumUnsafe(target: Int) -> [Self] {
    self
      .combinations(ofCount: 4)
      .filter { $0.reduce(0, +) == target }
  }
}

extension Array where Element: FixedWidthInteger & SignedInteger {
  func fourSumSafe(target: Int) -> [Self] {
    self
      .combinations(ofCount: 4)
      .filter { $0.sum() == target }
  }
}
