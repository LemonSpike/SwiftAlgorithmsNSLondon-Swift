//
//  SumArrayElements.swift
//  
//
//  Created by Pranav Kasetti on 12/04/2021.
//

import Foundation

// This handles integer overflow.
extension Sequence where Element: FixedWidthInteger & SignedInteger {
  func sum() -> Element {
    var result: Element = 0
    var overflow: Bool = false
    var totalOverflow: Int = 0
    for element in self {
      (result, overflow) = result.addingReportingOverflow(element)
      if overflow {
        totalOverflow += (element < 0) ? -1 : 1
      }
    }
    guard totalOverflow == 0 else { preconditionFailure() }
    return result
  }
}
