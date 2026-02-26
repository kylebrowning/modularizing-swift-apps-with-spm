# Modularizing Swift Apps with SPM

Companion code for the [Modularizing Swift Apps with SPM](https://kylebrowning.com/series/modularizing-swift-apps) blog series.

## Series

| # | Post | Date |
|---|------|------|
| 1 | [Modularizing Swift Apps with SPM](https://kylebrowning.com/posts/modularizing-swift-apps-with-spm) | Feb 26 |
| 2 | [Adding Reservations to Your Modular App](https://kylebrowning.com/posts/adding-reservations-to-your-modular-app) | Feb 27 |
| 3 | [Wiring It All Together: The Main App](https://kylebrowning.com/posts/wiring-it-all-together) | Feb 27 |
| 4 | [Preview Apps for Lightning-Fast Iteration](https://kylebrowning.com/posts/preview-apps-for-fast-iteration) | Feb 27 |
| 5 | [Building a Design System Module](https://kylebrowning.com/posts/building-a-design-system-module) | Feb 27 |
| 6 | [Multi-Package Architecture](https://kylebrowning.com/posts/multi-package-architecture) | Feb 27 |

## Structure

```
LandmarksPackage/
├── Sources/
│   ├── Env/                  # Environment configuration (Common)
│   ├── Logger/               # Logging utilities (Common)
│   ├── Toolkit/              # Shared utilities + NetworkClient (Common)
│   ├── LandmarksApi/         # API models + endpoints
│   ├── LandmarksDomain/      # Domain models, services, mocks
│   └── LandmarksFeature/     # SwiftUI views
└── Tests/
    └── LandmarksDomainTests/ # Domain mapping tests
```

## Building

```bash
cd LandmarksPackage
swift build
swift test
```

## License

MIT
