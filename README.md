# Navigator Example: Named Routes

This project is the **`named-routes` branch** of the navigation example.
It demonstrates how Flutter navigation works when pages are given names in
advance.

The project is designed to be compared with the `manual-navigation` branch.
Both branches use the same pages, but they decide where to navigate in
different ways.

## Learning Goals

After studying this branch, students should be able to:

- Explain what a navigation stack is.
- Register pages with route names.
- Navigate with `Navigator.pushNamed`.
- Replace a page with `Navigator.pushReplacementNamed`.
- Return to an earlier page with `Navigator.pop`.
- Remove pages until a named route with `Navigator.popUntil`.
- Pass data to a named route with `arguments`.
- Return a result from a page with `Navigator.pop`.

## Manual Navigation Compared With Named Routes

In the `manual-navigation` branch, the destination page is created at the
moment the button is pressed:

```dart
Navigator.push(
	context,
	MaterialPageRoute(builder: (context) => const SecondPage()),
);
```

This is easy to understand for a small application, but the navigation code
must know which widget to construct.

In this `named-routes` branch, the page is registered once in `main.dart`:

```dart
routes: {
	AppRoutes.second: (context) => const SecondPage(),
},
```

The button only uses the route name:

```dart
Navigator.pushNamed(context, AppRoutes.second);
```

The `Navigator` asks the `MaterialApp` route table to find and create the
page. This separates the navigation request from the page construction.

## How This Branch Is Organized

### `lib/app_routes.dart`

This file stores route names in one place:

```dart
class AppRoutes {
	static const home = '/';
	static const second = '/second';
	static const third = '/third';
}
```

Using constants prevents spelling mistakes such as `'/seond'` in one file
and `'/second'` in another file.

### `lib/main.dart`

`MaterialApp` contains the route table:

```dart
initialRoute: AppRoutes.home,
routes: {
	AppRoutes.home: (context) => const FirstPage(),
	AppRoutes.second: (context) => const SecondPage(),
	AppRoutes.third: (context) => const ThirdPage(),
},
```

The `initialRoute` tells Flutter which named route to show first.

### Page files

The page files request navigation by using route names:

- `first_page.dart` opens Page 2, the `PopScope` example, and the result page.
- `second_page.dart` opens Page 3 and pops back to Page 1.
- `third_page.dart` demonstrates a normal pop and `popUntil`.
- `willpop_page.dart` demonstrates controlling whether a page can be popped.
- `pop_result_page.dart` sends a value back to Page 1.

## Passing Data With a Named Route

The first page sends data when it opens the result page:

```dart
Navigator.pushNamed(
	context,
	AppRoutes.popResult,
	arguments: 'Some data from Page 1',
);
```

The route builder reads that data from `RouteSettings` in `main.dart`:

```dart
final data =
		ModalRoute.of(context)?.settings.arguments as String? ??
		'No data provided';
```

The result page sends a value back with:

```dart
Navigator.pop(context, result);
```

The first page waits for that value and displays it in a snackbar.

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

To compare the two navigation styles, view the same button in each branch:

```bash
git switch manual-navigation
git switch named-routes
```

Look for the difference between `MaterialPageRoute` and
`Navigator.pushNamed`. The page layouts are intentionally similar so that
the navigation change is easy to identify.

## Useful Commands

```bash
flutter analyze
flutter test
```

`flutter analyze` checks the Dart code for errors and warnings. `flutter test`
runs the widget tests.

## Next Step: `go_router`

Named routes are useful for learning the fundamentals. For larger applications
with deep links, redirects, nested navigation, and browser URLs, the next
version of this lesson can introduce the `go_router` package.
