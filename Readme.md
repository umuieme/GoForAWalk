
# Walking Buddy
An iOS app that connects individuals who want to walk together. Create and join walking events, find nearby walking partners, and build a community around healthy, social walking experiences.
## Features
Core Features

User Authentication - Secure Firebase-based registration and login
Walking Events - Create, discover, and join walking events in your area
Real-time Buddy Matching - Find compatible walking partners based on location and preferences
Live GPS Tracking - Track your walks with MapKit integration
Walk History - Log and review your walking activities with detailed stats
Buddy Request System - Send and manage walking partnership requests


## Architecture
This project follows MVVM (Model-View-ViewModel) architecture with SwiftUI and is organized using a feature-based folder structure for scalability and maintainability.

### Tech Stack

Frontend: SwiftUI
Backend: Firebase (Authentication, Firestore, Cloud Storage) or AppWrite
Maps: MapKit, Core Location
Local Storage: Core Data, UserDefaults

### Project Structure Sample

<pre>
WalkingBuddy/
├── App/
│   └── WalkingBuddyApp.swift          # Entry point of the SwiftUI app
├── Core/
│   ├── Components/                    # Reusable UI components
│   ├── Extensions/                    # Shared extensions for various types
│   └── Utils/                         # Core utility functions
├── Models/
│   ├── User.swift                     # User model
│   └── Event.swift                    # Event model
├── Extensions/
│   └── StringExtension.swift          # String-related extension methods
├── Features/
│   ├── Common/
│   │   └── PrimaryButton.swift        # Common styled button component
│   ├── Authentication/
│   │   ├── ViewModels/                # Auth-related view models
│   │   └── Views/                     # Auth-related SwiftUI views
│   └── WalkEvents/
│       ├── ViewModels/                # Walk event-related view models
│       └── Views/                     # Walk event-related SwiftUI views
├── Services/
│   ├── ApiHelper.swift                # Network abstraction layer
│   └── AuthService.swift              # Authentication service logic
└── Utils/                             # Additional utilities
</pre>
