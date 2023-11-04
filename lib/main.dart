import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Color Pickers',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      home: const Home()
    );
  }
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Color myColor = Colors.lightBlue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text('Color Pickers')
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // Default Color Picker
              FilledButton(
                onPressed: (){
                  showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: const Text('Pick Color'),
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            pickerColor: myColor,
                            onColorChanged: (Color color) {
                              setState(() {
                                myColor = color;
                              });
                            },
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('DONE'),
                            onPressed: () => Get.back()
                          ),
                        ],
                      );
                    }
                  );
                },
                child: const Text('Default Color Picker')
              ),
              const SizedBox(height: 20),

              // Material Color Picker
              FilledButton(
                onPressed: (){
                  showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: const Text('Pick Color'),
                        content: SingleChildScrollView(
                          child: MaterialPicker(
                            pickerColor: myColor,
                            onColorChanged: (Color color) {
                              setState(() {
                                myColor = color;
                              });
                            },
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('DONE'),
                            onPressed: () => Get.back()
                          ),
                        ],
                      );
                    }
                  );
                },
                child: const Text('Material Color Picker')
              ),
              const SizedBox(height: 20),

              // Block Color Picker
              FilledButton(
                  onPressed: (){
                    showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: const Text('Pick Color'),
                            content: SingleChildScrollView(
                              child: BlockPicker(
                                pickerColor: myColor,
                                onColorChanged: (Color color) {
                                  setState(() {
                                    myColor = color;
                                  });
                                },
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                  child: const Text('DONE'),
                                  onPressed: () => Get.back()
                              ),
                            ],
                          );
                        }
                    );
                  },
                  child: const Text('Block Color Picker')
              ),
              const SizedBox(height: 20),

              // Multiple Color Picker
              FilledButton(
                  onPressed: (){
                    showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: const Text('Pick Color'),
                            content: SingleChildScrollView(
                              child: MultipleChoiceBlockPicker(
                                pickerColors: const [Colors.red,Colors.blue],
                                onColorsChanged: (List<Color> color) {
                                  setState(() {
                                    print(color);
                                  });
                                },
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                  child: const Text('DONE'),
                                  onPressed: () => Get.back()
                              ),
                            ],
                          );
                        }
                    );
                  },
                  child: const Text('Multiple Color Picker')
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
