# Navigator Example: Manual Navigation

This project is the **`manual-navigation` branch** of the navigation example.
It teaches Flutter navigation using the built-in `Navigator` directly.

The same pages are used in the `named-routes` and `go-router` branches. This
branch is the starting point because every navigation action is visible where
the button is defined.

## Learning Goals

After studying this branch, students should be able to:

- Explain the navigation stack.
- Open a page with `Navigator.push`.
- Create a destination with `MaterialPageRoute`.
- Replace the current page with `Navigator.pushReplacement`.
- Return to the previous page with `Navigator.pop`.
- Remove pages with `Navigator.popUntil`.
- Pass a result back from a page.
- Explain the difference between manual navigation and named routes.

## What Is Manual Navigation?

In manual navigation, the button creates the destination page directly:

```dart
Navigator.push(
	context,
	MaterialPageRoute(builder: (context) => const SecondPage()),
);
```

`Navigator.push` adds a new route to the navigation stack. The
`MaterialPageRoute` tells Flutter which widget should be displayed.

This approach is useful for learning because the complete navigation action is
in one place. The tradeoff is that each page must know which widget to create.

## How This Branch Is Organized

### `lib/main.dart`

The app starts with a widget:

```dart
MaterialApp(
	home: const FirstPage(),
)
```

There is no route table in this branch. Pages are created by the navigation
callbacks in the page files.

### `lib/page/first_page.dart`

Page 1 demonstrates:

- `Navigator.push` to add Page 2.
- `Navigator.pushReplacement` to replace Page 1 with Page 2.
- `Navigator.push` to open the PopScope example.
- Waiting for a result from the PopResult page.

### `lib/page/second_page.dart`

Page 2 demonstrates pushing Page 3 and popping back to Page 1.

### `lib/page/third_page.dart`

Page 3 demonstrates popping one page and using `popUntil` to remove pages until
the first route remains.

### `lib/page/willpop_page.dart`

This page uses `PopScope` to control whether the system back action can remove
the page.

### `lib/page/pop_result_page.dart`

This page receives data through its constructor and sends a result back when it
is popped.

## The Navigation Stack

Each pushed page is placed above the previous page:

```text
Page 1
Page 1 -> Page 2
Page 1 -> Page 2 -> Page 3
```

Calling `Navigator.pop(context)` removes the page at the top of the stack.
Calling `Navigator.popUntil` repeatedly removes pages until its condition is
true.

## Passing Data and Returning a Result

Page 1 creates the result page and passes data through its constructor:

```dart
final result = await Navigator.push(
	context,
	MaterialPageRoute(
		builder: (context) =>
				PopResultPage(data: 'Some data from Page 1'),
	),
);
```

The result page sends a value back with:

```dart
Navigator.pop(context, result);
```

The `await` expression in Page 1 receives that value after the result page is
closed.

## Try the Example

Run the app in a browser:

```bash
flutter pub get
flutter run -d chrome
```

Try these actions in order:

1. Push Page 2 and then Page 3.
2. Pop back one page at a time.
3. Use Pop All on Page 3 to return to Page 1.
4. Open the PopResult page, enter text, and return the result.
5. Open the PopScope page and try navigating back with the switch disabled.

## Compare the Branches

```bash
git switch named-routes
git switch go-router
git switch manual-navigation
```

Compare the Page 2 button in each branch:

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

The page layouts are intentionally similar so students can focus on how the
routing strategy changes.

## Useful Commands

```bash
flutter analyze
flutter test
```

`flutter analyze` checks the Dart code for errors and warnings. `flutter test`
runs the widget tests.

## Next Steps

After understanding this branch, study `named-routes` to separate route names
from page construction. Then study `go-router` to learn URL-aware routing,
deep links, redirects, and nested navigation.
