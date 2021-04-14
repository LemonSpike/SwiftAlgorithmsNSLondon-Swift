// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to
//build this package.

import PackageDescription

let package = Package(
  name: "SwiftAlgorithmsAsAPackage",
  products: [
    // Products define the executables and libraries a package produces,
    // and make them visible to other packages.
    .library(
      name: "SwiftAlgorithmsAsAPackage",
      targets: ["SwiftAlgorithmsAsAPackage"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-algorithms", from: "0.0.4")
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a
    // module or a test suite.
    // Targets can depend on other targets in this package, and on products in
    // packages this package depends on.
    .target(
      name: "SwiftAlgorithmsAsAPackage",
      dependencies: [
        .product(name: "Algorithms", package: "swift-algorithms")
      ]),
    .testTarget(
      name: "SwiftAlgorithmsAsAPackageTests",
      dependencies: ["SwiftAlgorithmsAsAPackage"])
  ]
)
