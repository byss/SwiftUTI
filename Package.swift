// swift-tools-version:5.3

import PackageDescription

private let libraryName = "SwiftUTI";

let package = Package (
	name: libraryName,
	platforms: [.iOS (.v10), .macOS (.v10_12), .tvOS (.v9)],
	products: [ .library (name: libraryName, targets: [libraryName]) ],
	targets: [ .target (name: libraryName, path: ".", exclude: ["LICENSE"]) ]
);
