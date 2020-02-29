## Provider
+ To pass the function and data around
+ Change a widget based on change in some other widget.

### Steps:
+  Wrap runApp() with `Provider()` or `MultiProvers()`
+ Add required provers:
    + `ChangeNotifierProvider`
    + `Provider`
    +
+ Add variable or instance of a class(whose method or data we need to access) to the provider
    + E.g:
        + instance:    `ChangeNotifierProvider(create(context)=>instance1())`
        + varible:      `ChangeNotifierProvider.value(create(context)=>variable)`
+ `create` is used to create in instance inside provider.

+ `Consumer`, `Selector` or `Provider.of` is used to access the value.

+ Example:
    + Part: 1 Class containing the value and Methods
    ```dart
        class Counter with ChangeNotifier {
          int value = 0;
          void increment() {
            value += 1;
            notifyListeners();
          }
        }
    ```

    + Part: 2 Adding it to top of widget tree.
    ```dart
        `void main() => runApp(MultiProvider(providers: [
         ChangeNotifierProvider(create: (context)=>Counter())],
         child:MyApp(),));
    ```
    + Part: 3 Access the value
    ```dart
         Consumer<Counter>(
              builder: (context, counter, child) => Text('${counter.value}'),
        ),
    ```