# CC020.23 Lesson Plan: Flutter Navigation

**Course:** CC020.23 - Mobile Applications Development  
**Instructor:** Mr. Joshua M. Cister  
**Repository:** [navigator_example](https://github.com/Cisterakas/navigator_example)

## Lesson Title

**Understanding Flutter Navigation: From Navigator Fundamentals to go_router**

## Lesson Purpose

This repository teaches Flutter navigation through three implementations of the
same application. Students begin with the fundamentals, then compare more
structured routing approaches.

The progression is:

```text
Manual navigation
      |
      v
Named routes
      |
      v
go_router
```

Each branch uses the same page examples so students can focus on how the
navigation strategy changes.

## Learning Analogy

Use a building analogy:

- The app is a building.
- Each Flutter page is a room.
- The navigation stack is a stack of room cards.
- `push` adds a new room card.
- `pop` removes the top room card.
- `pushReplacement` replaces the current room card.
- Named routes are room numbers or addresses.
- `go_router` is a receptionist or GPS that knows how to reach every room and URL.

Example stack:

```text
Page 1
Page 1 -> Page 2
Page 1 -> Page 2 -> Page 3
```

When Page 3 calls `pop`, the app returns to Page 2.

## Learning Outcomes

By the end of the lesson, students should be able to:

1. Explain the navigation stack.
2. Navigate using `Navigator.push`.
3. Create pages with `MaterialPageRoute`.
4. Return to a previous page with `Navigator.pop`.
5. Replace routes with `pushReplacement`.
6. Remove multiple routes with `popUntil`.
7. Pass data to another page.
8. Return a result from a page.
9. Explain the difference between manual navigation, named routes, and `go_router`.
10. Select an appropriate routing approach for a project.

## Repository Branches

### `master`

The stable course starting point and learning roadmap. It contains the manual
navigation baseline.

### `manual-navigation`

Students learn:

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const SecondPage(),
  ),
);
```

This branch teaches the underlying navigation mechanics directly.

### `named-routes`

Students learn:

```dart
Navigator.pushNamed(context, AppRoutes.second);
```

They compare route names with manually constructing pages.

### `go-router`

Students learn:

```dart
context.push(AppRoutes.second);
```

They explore centralized routing, URL paths, browser navigation, and scalable
routing.

Do not merge all three implementations into `master`. They are alternative
versions of the same application.

## Suggested Schedule

### Part 1: Mental Model and Manual Navigation

**Suggested time:** 20 minutes

Explain:

- What a page is.
- What a route is.
- What the Navigator does.
- What the navigation stack represents.

Demonstrate Page 1, Page 2, and Page 3 using the application.

Ask students:

> If Page 1 opens Page 2 and Page 2 opens Page 3, how many routes are on the stack?

Expected answer: three routes.

### Part 2: Manual Navigation Demonstration

**Suggested time:** 30 minutes

Switch to the manual branch:

```bash
git switch manual-navigation
```

Students inspect:

- `lib/main.dart`
- `lib/page/first_page.dart`
- `lib/page/second_page.dart`
- `lib/page/third_page.dart`

Focus on:

```dart
Navigator.push(...)
Navigator.pushReplacement(...)
Navigator.pop(...)
Navigator.popUntil(...)
```

#### Activity

Students add a new button on Page 2 that opens Page 3, then add a button that
returns to Page 1.

### Part 3: Passing Data and Returning Results

**Suggested time:** 25 minutes

Use `pop_result_page.dart`.

Explain this flow:

```text
Page 1 opens PopResultPage
Page 1 waits
The student enters text
PopResultPage returns the text
Page 1 displays the result
```

Opening the page:

```dart
final result = await Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => PopResultPage(
      data: 'Some data from Page 1',
    ),
  ),
);
```

Returning the result:

```dart
Navigator.pop(context, result);
```

Ask students:

> Why does Page 1 use `await`?

Expected answer: because the result is returned later, after the result page is
closed.

### Part 4: Named Routes

**Suggested time:** 30 minutes

Switch branches:

```bash
git switch named-routes
```

Compare:

```dart
// Manual navigation
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const SecondPage(),
  ),
);

// Named routes
Navigator.pushNamed(context, AppRoutes.second);
```

Explain that the route table moves page registration into one central location.

Students inspect:

- `lib/app_routes.dart`
- `MaterialApp.routes`
- `Navigator.pushNamed`
- `RouteSettings.arguments`

Discussion question:

> What does named routing improve?

Expected answers include centralized route definitions, fewer page-construction
details in button callbacks, clearer route names, and separation between
navigation and page creation.

### Part 5: go_router

**Suggested time:** 35 minutes

Switch branches:

```bash
git switch go-router
```

Show:

```dart
MaterialApp.router(
  routerConfig: appRouter,
)
```

Then inspect `lib/app_router.dart`.

Compare:

```dart
Navigator.pushNamed(context, AppRoutes.second);
```

with:

```dart
context.push(AppRoutes.second);
```

Explain the main methods:

- `context.push`: adds a page to the stack.
- `context.pop`: removes the current page.
- `context.go`: changes the current location.
- `context.pushReplacement`: replaces the current page.
- `extra`: passes data to a route.

Connect this to browser URLs:

```text
/        Page 1
/second  Page 2
/third   Page 3
```

Discuss why URL-aware routing matters for Flutter web applications, deep links,
authentication redirects, nested navigation, and browser back/forward buttons.

## Student Activities

The complete student worksheet is in [STUDENT_ACTIVITIES.md](STUDENT_ACTIVITIES.md).

It includes:

- Predicting the navigation stack.
- Adding a new page in all three branches.
- Passing data and returning a result.
- Comparing manual navigation, named routes, and `go_router`.
- Explaining the building analogy.
- A submission checklist.

## Assessment

### Formative Questions

1. What does `push` do?
2. What does `pop` do?
3. Why is `MaterialPageRoute` needed?
4. What happens to the stack after `pushReplacement`?
5. Why does Page 1 use `await` for a result?
6. What is the purpose of `AppRoutes`?
7. What does `context.go` do differently from `context.push`?
8. Why are URLs useful in Flutter web applications?

### Practical Assessment

Students implement a new page in all three branches.

Required features:

- Open the page.
- Display a title.
- Navigate back.
- Pass one value into the page.
- Return one result from the page.
- Explain how the implementation differs in each branch.

### Suggested Rubric

| Criterion                                | Weight |
| ---------------------------------------- | -----: |
| Navigation works                         |    30% |
| Correct routing approach for each branch |    25% |
| Data passing and result handling         |    20% |
| Code organization                        |    15% |
| Explanation of differences               |    10% |

## Common Misconceptions

### A page and a route are the same thing

A page is a widget. A route is the navigation entry that displays that widget.

### Pop creates the previous page

Usually, `pop` removes the current route and reveals the route already beneath it.

### Named routes are automatically better

Named routes improve organization, but they do not provide all the features of
`go_router`.

### go_router removes the need to understand Navigator

It does not. Students still need to understand the stack because push, pop,
and replacement behavior still matter.

## Instructor Workflow

Use this sequence during class:

```bash
git switch master
flutter pub get
flutter run -d chrome

git switch manual-navigation
git switch named-routes
git switch go-router
```

Ask students to inspect the same Page 2 button in each branch. This creates the
clearest comparison because the visible application behavior is similar while
the routing implementation changes.

## Final Teaching Message

> Abstractions are easier to understand when the underlying mechanism is already familiar.

Students first learn how Flutter navigation works manually. Named routes then
improve organization. `go_router` adds scalable, URL-aware routing for larger
applications.

## Useful Commands

```bash
flutter analyze
flutter test
```
