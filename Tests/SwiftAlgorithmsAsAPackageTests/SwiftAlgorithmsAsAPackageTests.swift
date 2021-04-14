import XCTest
@testable import SwiftAlgorithmsAsAPackage

final class SwiftAlgorithmsAsAPackageTests: XCTestCase {

  // MARK: Q One
  static let qOneSolution = [[-2, -1, 1, 2], [-2, 0, 0, 2], [-1, 0, 0, 1]]

  func test_q_one_solutions_on_empty_array() throws {
    let combos = QOneSolutionOne().fourSum([], target: 9)
    XCTAssertEqual(combos, [])
    let setCombos = QOneSolutionTwo().fourSum([], target: 9)
    XCTAssertEqual(setCombos, [])
  }

  func test_q_one_solutions() throws {
    let combos = QOneSolutionOne().fourSum([1, 0, -1, 0, -2, 2], target: 0)
    XCTAssertEqual(combos, Self.qOneSolution)
    let setCombos = QOneSolutionTwo().fourSum([1, 0, -1, 0, -2, 2], target: 0)
    XCTAssertEqual(setCombos, Set(Self.qOneSolution.map(Set.init)))
  }

  func test_q_one_measure_raw_performance() throws {
    measure(metrics: [XCTClockMetric(), XCTMemoryMetric(), XCTStorageMetric()],
            block: {
      var sums: [[[Int]]] = []
      (1...100).counters.forEach {
        let sum = QOneSolutionOne().fourSum([1, 0, -1, 0, -2, 2, 3, -3, 0, 4,
                                             -2, 5, -4, 6, -6, 7, -8, 8, -7],
                                            target: 0)
        sums.append(sum)
      }
    })
  }

  func test_q_one_measure_algorithms_performance() throws {
    measure(metrics: [XCTClockMetric(), XCTMemoryMetric(), XCTStorageMetric()],
            block: {
      var sums: [Set<Set<Int>>] = []
      (1...100).counters.forEach {
        let sum = QOneSolutionTwo().fourSum([1, 0, -1, 0, -2, 2, 3, -3, 0, 4,
                                             -2, 5, -4, 6, -6, 7, -8, 8, -7],
                                            target: 0)
        sums.append(sum)
      }
    })
  }

  // MARK: Q Two
  static let qTwoSolution = ["wad", "xad", "yad", "zad", "wbd", "xbd", "ybd",
                               "zbd", "wcd", "xcd", "ycd", "zcd", "wae", "xae",
                               "yae", "zae", "wbe", "xbe", "ybe", "zbe", "wce",
                               "xce", "yce", "zce", "waf", "xaf", "yaf", "zaf",
                               "wbf", "xbf", "ybf", "zbf", "wcf", "xcf", "ycf",
                               "zcf"]

  func test_q_two_solutions_on_empty_number() throws {
    var combos = "".phoneNumberCombinationsRecursiveBFSAlgorithms()
    XCTAssertEqualSequences(combos, [])
    combos = "".phoneNumberCombinationsIterative()
    XCTAssertEqualSequences(combos, [])
    combos = "".phoneNumberCombinationsRecursiveDFS()
    XCTAssertEqualSequences(combos, [])
  }

  func test_q_two_solutions() throws {
    var combos = "923".phoneNumberCombinationsIterative()
    XCTAssertEqualSequences(combos, Self.qTwoSolution)
    combos = "923".phoneNumberCombinationsRecursiveDFS()
    XCTAssertEqual(Set(combos), Set(Self.qTwoSolution))
    combos = "923".phoneNumberCombinationsRecursiveBFSAlgorithms()
    XCTAssertEqualSequences(combos, Self.qTwoSolution)
  }

  func test_q_two_measure_dfs_iterative_performance() throws {
    measure(metrics: [XCTClockMetric(), XCTMemoryMetric()],
            block: {
      var results: [[String]] = []
      (1...10).counters.forEach {
        let result = "942493289372".phoneNumberCombinationsIterative()
        results.append(result)
      }
    })
  }

  func test_q_two_measure_dfs_recursive_performance() throws {
    measure(metrics: [XCTClockMetric(), XCTMemoryMetric()],
            block: {
      var results: [[String]] = []
      (1...10).counters.forEach {
        let result = "942493289372".phoneNumberCombinationsRecursiveDFS()
        results.append(result)
      }
    })
  }

  func test_q_two_measure_algorithms_bfs_recursive_performance() throws {
    measure(metrics: [XCTClockMetric(), XCTMemoryMetric()],
            block: {
      var results: [[String]] = []
      (1...10).counters.forEach {
        let result = "942493289372"
          .phoneNumberCombinationsRecursiveBFSAlgorithms()
        results.append(result)
      }
    })
  }

  static var allTests = [
    ("testQuestionOneAllSolutionsEmptyArray",
     test_q_one_solutions_on_empty_array),
    ("testQuestionOneAllSolutions",
     test_q_one_solutions),
    ("testQuestionOneRawPerformance",
     test_q_one_measure_raw_performance),
    ("testQuestionOneAlgosPerformance",
     test_q_one_measure_algorithms_performance),
    ("testQuestionTwoAllSolutionsEmptyNumber",
     test_q_two_solutions_on_empty_number),
    ("testQuestionTwoAllSolutions",
     test_q_two_solutions),
    ("testQuestionTwoDFSIterativePerformance",
     test_q_two_measure_dfs_iterative_performance),
    ("testQuestionTwoDFSRecursivePerformance",
     test_q_two_measure_dfs_recursive_performance),
    ("testQuestionTwoRecursiveAlgorithmsPerformance",
     test_q_two_measure_algorithms_bfs_recursive_performance)
  ]
}
