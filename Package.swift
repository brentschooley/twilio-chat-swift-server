import PackageDescription

let package = Package(
    name: "token-server",
    dependencies: [
        .Package(
          url: "https://github.com/vapor/vapor.git",
          majorVersion: 1,
          minor: 5
        ),
        .Package(
          url: "https://github.com/brentschooley/TwilioAccessToken.git",
          majorVersion: 0,
          minor: 4
        ),
        .Package(
          url: "https://github.com/czechboy0/Environment.git",
          majorVersion: 0,
          minor: 6
        )
    ],
    exclude: [
        "Config",
        "Database",
        "Localization",
        "Public",
        "Resources",
    ]
)
