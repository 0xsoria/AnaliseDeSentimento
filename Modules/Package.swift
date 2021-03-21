// swift-tools-version:5.3

/**
 This Package defines the modular architecture used by our app.

 Note: A Feature module can import Core, Root and Dependencies modules. And can't import other Feature modules or even the App module.

 App -> Features -> Core -> Root -> Dependencies

*/

import PackageDescription

let package = Package(
    name: "Modules",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "Modules",
            targets: [
                // MARK: Root modules
                "RootElements",

                // MARK: Core modules
                "CoreProviders",

                // MARK: Features modules
                "FeatureTweets",
                
                "FeatureMoodAnalyzer",

                // MARK: App
                "App",
            ]
        )
    ],
    dependencies: [],
    targets: [
        // MARK: - Root

        /// This module contains elements that are common to multiple frameworks.
        /// Like UserDefaults components, Container ViewControllers, etc.
        .target(
            name: "RootElements",
            dependencies: [
            ]
        ),
        .testTarget(
            name: "RootElements-Tests",
            dependencies: [
                "RootElements"
            ]
        ),

        /// This module contains the all the functionality that connects to an external service.
        /// Like API calls, Endpoints, Keychain etc.
        .target(
            name: "CoreProviders",
            dependencies: [
                "RootElements"
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "CoreProviders-Tests",
            dependencies: [
                "CoreProviders"
            ], resources: [.copy("Resources")]
        ),

        /// This modules contains the app tweets displayer
        .target(
            name: "FeatureTweets",
            dependencies: [
                "CoreProviders",
                "RootElements"
            ]
        ),
        .testTarget(
            name: "FeatureTweets-Tests",
            dependencies: [
                "FeatureTweets"
            ]
        ),
        .target(name: "FeatureMoodAnalyzer",
                dependencies: ["CoreProviders", "RootElements"],
                resources: [.process("Resources")]),
        
        .testTarget(name: "FeatureMoodAnalyzer-Tests",
                    dependencies: ["FeatureMoodAnalyzer"],
                    resources: [.copy("Resources")]
        ),
        // MARK: - App
        .target(
            name: "App",
            dependencies: [
                "FeatureTweets",
                "FeatureMoodAnalyzer"
            ]
        ),
        .testTarget(
            name: "App-Tests",
            dependencies: [
                "App"
            ]
        )
    ]
)
