// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "GoTrueHTTP",
  platforms: [.iOS(.v13), .macCatalyst(.v13), .macOS(.v10_15), .watchOS(.v6), .tvOS(.v13)],
  products: [
    .library(name: "GoTrueHTTP", targets: ["GoTrueHTTP"])
  ],
  dependencies: [
    .package(url: "https://github.com/kean/Get", branch: "main"),
    .package(url: "https://github.com/kean/URLQueryEncoder", branch: "main"),
  ],
  targets: [
    .target(
      name: "GoTrueHTTP",
      dependencies: [
        .product(name: "Get", package: "Get"),
        .product(name: "URLQueryEncoder", package: "URLQueryEncoder"),
      ]
    )
  ]
)
