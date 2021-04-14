//
//  TestUtilities.swift
//
//
//  Created by Pranav Kasetti on 12/03/2021.
//

import Foundation
import XCTest

func XCTAssertEqualSequences<S1: Sequence, S2: Sequence>(
  _ expression1: @autoclosure () throws -> S1,
  _ expression2: @autoclosure () throws -> S2,
  _ message: @autoclosure () -> String = "",
  file: StaticString = #file, line: UInt = #line
) rethrows where S1.Element: Equatable, S1.Element == S2.Element {
  try XCTAssert(expression1().elementsEqual(expression2()), message(),
                file: file, line: line)
}

extension Sequence {
  var counters: [Void] {
    return self.map { _ in
      return Void()
    }
  }
}
