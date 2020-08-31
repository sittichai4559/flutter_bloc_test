import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/counter.dart';

void main() => runApp(BlocProvider(
      builder: (BuildContext context) => CounterBloc(),
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  /* int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  } */

  @override
  Widget build(BuildContext context) {
    final counterBloc =
        BlocProvider.of<CounterBloc>(context); // เรียกใช้ CounterBloc
    return BlocBuilder(
        // เมื่อสร้าง widget ที่ต้องการนำค่าจาก bloc มาใช้ ให้นำ BlocBuilder มาคลุม
        bloc: counterBloc, // ระบุ counterBloc ที่เราสร้าง
        builder: (BuildContext context, CounterState state) {
          final counter = (state as UpdateCounterState)
              .counter; // ค่านับเลขถูกเรียกจาก state โดยเราจะระบุ state ที่นำมาใช้งานด้วย เพื่อให้ complier เราสามารถเข้าใจว่ามีตัวแปรใดบ้างในคลาสของ state นี้
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    /* '$_counter', */
                    '$counter', // เราเรียก counter มาใช้งานได้เลย
                    style: Theme.of(context).textTheme.display1,
                  ),
                ],
              ),
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () =>
                      counterBloc.dispatch(IncrementCounter(counter)),
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                ), // เพิ่มช่องว่าระหว่างปุ่ม
                FloatingActionButton(
                  onPressed: () => counterBloc.dispatch(DecrementCounter(
                      counter)), // ทำหน้าที่ส่ง DecrementCounter(counter) แทน
                  tooltip: 'Increment',
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          );
        });
  }
}
