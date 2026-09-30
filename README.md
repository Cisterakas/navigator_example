# Flutter Navigation Learning Project

This repository is a teaching example for comparing three Flutter navigation
approaches. The `master` branch is the stable starting point and currently
contains the manual-navigation implementation.

## Learning Path

Study the branches in this order:

```text
master
	Manual navigation baseline
			|
			+-- manual-navigation
			|     Navigator.push and MaterialPageRoute
			|
			+-- named-routes
			|     Navigator.pushNamed and route tables
			|
			+-- go-router
						GoRouter and URL-aware navigation
```

The branches use the same page examples so students can focus on how the
routing strategy changes.

## What Is In Master?

The current implementation uses Flutter's built-in `Navigator` directly:

```dart
Navigator.push(
	context,
	MaterialPageRoute(builder: (context) => const SecondPage()),
);
```

This is the simplest approach to learn first. A button creates the destination
page, `push` adds it to the navigation stack, and `pop` removes it.

The examples also demonstrate:

- `Navigator.pushReplacement`.
- `Navigator.pop`.
- `Navigator.popUntil`.
- `PopScope` for controlling back navigation.
- Returning a result from a page.

## Compare the Implementations

Switch branches when you are ready to compare the same feature:

```bash
git switch manual-navigation
git switch named-routes
git switch go-router
git switch master
```

The main differences are:

```dart
// Manual navigation
Navigator.push(
	context,
	MaterialPageRoute(builder: (context) => const SecondPage()),
);

// Named routes
Navigator.pushNamed(context, AppRoutes.second);

// go_router
context.push(AppRoutes.second);
```

Do not merge all three implementations into `master`. They are alternative
versions of the same application, not features that need to run together.

## Run the Project

```bash
flutter pub get
flutter run -d chrome
```

Try Page 2, Page 3, the PopScope page, and the PopResult page. Pay attention to
how pages are added to and removed from the navigation stack.

## Useful Commands

```bash
flutter analyze
flutter test
```

`flutter analyze` checks the Dart code for errors and warnings. `flutter test`
runs the widget tests.

## Branch Responsibilities

- `master`: stable project starting point and learning roadmap.
- `manual-navigation`: detailed manual-navigation lesson.
- `named-routes`: named-route lesson.
- `go-router`: `go_router` lesson.

Keep the implementations separate so students can inspect each approach with
small, meaningful differences.
