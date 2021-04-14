//
//  QOneSolutionOne.swift
//
//
//  Created by Pranav Kasetti on 12/03/2021.
//

import Foundation

class QOneSolutionOne {
  func fourSum(_ nums: [Int], target: Int) -> [[Int]] {

    let nums = nums.sorted()
    return kSum(nums, target, 0, 4)
  }

  func kSum(_ nums: [Int], _ target: Int, _ start: Int, _ kValue: Int) -> [[Int]] {
    var res: [[Int]] = []
    if (start == nums.count) || (nums[start] * kValue > target) ||
       (target > nums[nums.count - 1] * kValue) {
      return res
    }
    if kValue == 2 {
      return twoSum(nums, target, start)
    }

    for index in start..<nums.count {
      if index == start || nums[index-1] != nums[index] {

        for seq in kSum(nums, target - nums[index], index+1, kValue-1) {
          res.append([nums[index]])
          res[res.count - 1].append(contentsOf: seq)
        }
      }
    }
    return res
  }

  func twoSum(_ nums: [Int], _ target: Int, _ start: Int) -> [[Int]] {
    var res: [[Int]] = []
    var low = start
    var high = nums.count - 1

    while low < high {
      let sum = nums[low] + nums[high]
      if sum < target || (low > start && nums[low] == nums[low - 1]) {
        low += 1
      } else if sum > target ||
                (high < (nums.count - 1) && nums[high] == nums[high + 1]) {
        high -= 1
      } else {
        res.append([nums[low], nums[high]])
        low += 1
        high -= 1
      }
    }

    return res
  }
}
