# Student Activities: Flutter Navigation

**Course:** CC020.23 - Mobile Applications Development

These activities use the `navigator_example` repository to help you understand
manual navigation, named routes, and `go_router`.

## Preparation

Clone the repository and run the project:

```bash
git clone https://github.com/Cisterakas/navigator_example.git
cd navigator_example
flutter pub get
flutter run -d chrome
```

Start with the manual-navigation implementation:

```bash
git switch manual-navigation
```

The same activities can later be repeated on the `named-routes` and `go-router`
branches.

## Activity 1: Predict the Navigation Stack

### Goal

Understand how pages are added to and removed from the navigation stack.

### Instructions

Start with Page 1 and draw the stack after every action:

```text
push Page 2
push Page 3
pop
push Page 2
popUntil Page 1
```

Use this format:

```text
Action: push Page 2
Stack: Page 1 -> Page 2
```

### Questions

1. Which page is visible after each action?
2. Which page is at the top of the stack?
3. What does `pop` remove?
4. What does `popUntil` remove?

### Expected Concept

`push` adds a route to the top of the stack. `pop` removes the route at the
top. `popUntil` continues removing routes until its condition is satisfied.

## Activity 2: Add a New Page

### Goal

Practice implementing the same navigation feature with three routing styles.

### Instructions

Create a new `FourthPage` with:

- An AppBar title of `Page 4`.
- A page heading.
- A button that returns to the previous page.
- A button on Page 3 that opens Page 4.

### Part A: Manual Navigation

Switch to the manual branch:

```bash
git switch manual-navigation
```

Open Page 4 with `Navigator.push` and `MaterialPageRoute`:

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const FourthPage(),
  ),
);
```

Return from Page 4 with:

```dart
Navigator.pop(context);
```

### Part B: Named Routes

Switch to the named-routes branch:

```bash
git switch named-routes
```

Add a route constant, register the page in the route table, and open it with:

```dart
Navigator.pushNamed(context, AppRoutes.fourth);
```

### Part C: go_router

Switch to the go-router branch:

```bash
git switch go-router
```

Add a `GoRoute` and open the page with:

```dart
context.push(AppRoutes.fourth);
```

### Questions

1. Where is `FourthPage` created in each branch?
2. Which branch has a centralized route definition?
3. Which branch uses URL paths directly?
4. Which implementation do you find easiest to read, and why?

## Activity 3: Return a Result

### Goal

Pass data into a page and return a value to the page that opened it.

### Instructions

Modify the result page so the student can enter one of the following:

- A text response.
- A number.
- A selected option.

The previous page should display the returned value.

### Manual Navigation

Open the page and wait for its result:

```dart
final result = await Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => PopResultPage(
      data: 'Data sent from Page 1',
    ),
  ),
);
```

Return the result:

```dart
Navigator.pop(context, result);
```

### Named Routes

Pass data using route arguments:

```dart
Navigator.pushNamed(
  context,
  AppRoutes.popResult,
  arguments: 'Data sent from Page 1',
);
```

Read the data from `RouteSettings.arguments` in the route builder.

### go_router

Pass data using `extra`:

```dart
final result = await context.push<String>(
  AppRoutes.popResult,
  extra: 'Data sent from Page 1',
);
```

Read the data from `state.extra` in the `GoRoute` builder and return it with:

```dart
context.pop(result);
```

### Questions

1. Why does the opening page use `await`?
2. What happens if the result page is closed without returning a value?
3. How is data passed differently in each branch?

## Activity 4: Compare the Branches

### Goal

Identify the differences between the three routing implementations.

Complete this table:

| Feature                | Manual | Named Routes | go_router |
| ---------------------- | ------ | ------------ | --------- |
| Destination definition |        |              |           |
| Navigation call        |        |              |           |
| Back navigation        |        |              |           |
| Passing data           |        |              |           |
| URL support            |        |              |           |
| Deep linking           |        |              |           |
| Best use case          |        |              |           |

Use these concepts to help complete the table:

- `MaterialPageRoute`
- `MaterialApp.routes`
- `GoRoute`
- `Navigator.push`
- `Navigator.pushNamed`
- `context.push`
- `Navigator.pop`
- `context.pop`
- `RouteSettings.arguments`
- `state.extra`

## Activity 5: Explain the Analogy

Use the building analogy to explain the following:

- What is the building?
- What is a room?
- What is the stack of room cards?
- What does `push` do?
- What does `pop` do?
- What do named routes represent?
- Why is `go_router` similar to a receptionist or GPS?

Write your explanation in five to eight sentences.

## Submission Checklist

Before submitting, verify that you can:

- [ ] Explain the navigation stack.
- [ ] Open and close pages in the manual branch.
- [ ] Add a new page in all three branches.
- [ ] Pass data into a page.
- [ ] Return a result from a page.
- [ ] Explain the difference between `push`, `pushNamed`, and `context.push`.
- [ ] Complete the comparison table.
- [ ] Run `flutter analyze` successfully.

## Useful Commands

```bash
flutter analyze
flutter test
flutter run -d chrome
```
