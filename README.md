# go_flavor

## A flutter module to resolve flavor dependency with UI and configuration

## There is a full article explaining each one of the following module:
1. Flavors
2. Flavors in Dart
3. Visually identifying each flavor
4. Identifying device info with the Banner
5. Flavors in Android
6. Running flavors with the IDE
7. Using flavor values

### Example
```dart
import 'package:go_flavor/src/go_flavor.dart';

void main() {
  FlavorConfig(
      flavor: Flavor.QA,
      color: Colors.deepPurpleAccent,
      values: FlavorValues(
          data: "Any tye of data and use anywhere in the app using 'FlavorConfig.instance.values' (optional)", message: "This is a demo application to show in dialog(optional)"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoFlavor Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
      child: Scaffold(
        appBar: AppBar(
          title: Text('page title'),
        ),
        body: _body(),
      ),
    );
  }
}


