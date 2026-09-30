# Navigator Example: go_router

This project is the **`go-router` branch** of the navigation example.
It demonstrates the same navigation screens using the `go_router` package.

The project can be compared with these earlier branches:

- `manual-navigation` creates pages with `MaterialPageRoute`.
- `named-routes` uses Flutter's `MaterialApp.routes` and `pushNamed`.
- `go-router` uses one `GoRouter` configuration and context navigation methods.

## Learning Goals

After studying this branch, students should be able to:

- Explain what a navigation stack is.
- Define application paths with `GoRoute`.
- Configure an app with `MaterialApp.router`.
- Add a page to the stack with `context.push`.
- Replace the current location with `context.go` or `context.pushReplacement`.
- Return to an earlier page with `context.pop`.
- Pass page data with `extra`.
- Understand why URL-aware routing is useful for Flutter web applications.

## Why go_router?

With manual navigation, a button constructs the destination page:

```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const SecondPage()),
);
```

With Flutter named routes, the button uses a registered name:

```dart
Navigator.pushNamed(context, AppRoutes.second);
```

With `go_router`, the router owns the navigation configuration and the page
uses a context extension:

```dart
context.push(AppRoutes.second);
```

The router can also work with browser URLs, deep links, redirects, and nested
navigation as an application grows.

## How This Branch Is Organized

### `lib/app_routes.dart`

This file stores the path strings in one place:

```dart
class AppRoutes {
  static const home = '/';
  static const second = '/second';
  static const third = '/third';
}
```

These constants reduce spelling mistakes and make route changes easier.

### `lib/app_router.dart`

This file owns the `GoRouter` configuration:

```dart
final appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.second,
      builder: (context, state) => const SecondPage(),
    ),
  ],
);
```

Each `GoRoute` connects a URL path to the widget shown at that path.

### `lib/main.dart`

`MaterialApp.router` gives Flutter the router configuration:

```dart
MaterialApp.router(
  routerConfig: appRouter,
)
```

This is different from `MaterialApp(home: ...)` and from
`MaterialApp(routes: ...)`.

### Page files

- `first_page.dart` demonstrates `push`, `pushReplacement`, and `extra`.
- `second_page.dart` demonstrates `push` and `pop`.
- `third_page.dart` demonstrates `pop` and returning to the home location.
- `willpop_page.dart` demonstrates controlling whether a page can be popped.
- `pop_result_page.dart` returns a value to the previous page.

## go_router Navigation Methods

### `context.push`

Adds a new page to the navigation stack:

```dart
context.push(AppRoutes.second);
```

### `context.go`

Changes the current location. In this example it is used for "Pop All" because
the app returns directly to the home location:

```dart
context.go(AppRoutes.home);
```

### `context.pop`

Removes the current page:

```dart
context.pop();
```

## Passing Data and Returning a Result

The first page passes data with `extra`:

```dart
final result = await context.push<String>(
  AppRoutes.popResult,
  extra: 'Some data from Page 1',
);
```

The router reads that value from `state.extra`:

```dart
final data = state.extra as String? ?? 'No data provided';
```

The result page sends a value back with:

```dart
context.pop(result);
```

The first page receives the returned value and displays it in a snackbar.

## Try the Example

Install dependencies and run the app in a browser:

```bash
flutter pub get
flutter run -d chrome
```

Try these actions in order:

1. Push Page 2 and then Page 3.
2. Use the pop buttons to move backward through the stack.
3. Use Pop All on Page 3 to return to Page 1.
4. Open the PopResult page, enter text, and return the result.
5. Open the PopScope page and try navigating back with the switch disabled.

## Compare the Branches

```bash
git switch manual-navigation
git switch named-routes
git switch go-router
```

Compare the same button in each branch. The page layouts are intentionally
similar, so the routing differences are easier to identify.

## Useful Commands

```bash
flutter analyze
flutter test
```

`flutter analyze` checks the Dart code for errors and warnings. `flutter test`
runs the widget tests.
