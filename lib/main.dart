import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:expressions/expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Calculator'),
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
  String _inputText = '';
  String _outputText = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height:200,
              padding: EdgeInsets.all(5),
              alignment: Alignment.centerRight,
              child: Text(
                '$_inputText',
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.end,

              ),
            ),

            Row(
              children: [
                //OutputText Area
                Expanded(
                  flex: 3,
                  child: Text(
                    '$_outputText',
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.start,
                  ),
                ),
                //Equals Button
                Expanded(
                  flex:1,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: FlatButton(
                      onPressed: () => this.setState(() {
                        this._inputText = this.evaluate();
                        this._outputText = '';
                      }),
                      color: Colors.green[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '=',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline4,
                        )
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                //Button1
                Expanded(
                  flex:1,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: FlatButton(
                      onPressed: () => this.setState(() {
                        this._inputText = '${_inputText}1';
                        this._outputText = this.evaluate();
                      }),
                      color: Colors.amber[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            '1',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline4,
                          )
                      ),
                    ),
                  ),
                ),
                //Button2
                Expanded(
                  flex:1,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: FlatButton(
                      onPressed: () => this.setState(() {
                        this._inputText = '${_inputText}2';
                        this._outputText = this.evaluate();
                      }),
                      color: Colors.amber[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            '2',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline4,
                          )
                      ),
                    ),
                  ),
                ),
                //Button3
                Expanded(
                  flex:1,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: FlatButton(
                      onPressed: () => this.setState(() {
                        this._inputText = '${_inputText}3';
                        this._outputText = this.evaluate();
                      }),
                      color: Colors.amber[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            '3',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline4,
                          )
                      ),
                    ),
                  ),
                ),
                //ButtonBack
                Expanded(
                  flex:1,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: FlatButton(
                      onPressed: () => this.setState(() {
                        _inputText = _inputText.length > 1 ? _inputText.substring(0,_inputText.length-1) : '';
                        try{
                          this.evaluate();
                        }catch(ParseException){
                          _outputText = evaluate(_inputText.length > 1 ? _inputText.substring(0,_inputText.length-1) : '');
                        }
                      }),
                      onLongPress: () => this.setState(() {
                        this._inputText = '';
                        this._outputText = '';
                      }),
                      color: Colors.red[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                        Icons.arrow_back,
                        size: 40,
                      ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                //Button4
                Expanded(
                  flex:1,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: FlatButton(
                      onPressed: () => this.setState(() {
                        this._inputText = '${_inputText}4';
                        this._outputText = this.evaluate();
                      }),
                      color: Colors.amber[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            '4',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline4,
                          )
                      ),
                    ),
                  ),
                ),
                //Button5
                Expanded(
                  flex:1,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: FlatButton(
                      onPressed: () => this.setState(() {
                        this._inputText = '${_inputText}5';
                        this._outputText = this.evaluate();
                      }),
                      color: Colors.amber[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            '5',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline4,
                          )
                      ),
                    ),
                  ),
                ),
                //Button6
                Expanded(
                  flex:1,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: FlatButton(
                      onPressed: () => this.setState(() {
                        this._inputText = '${_inputText}6';
                        this._outputText = this.evaluate();
                      }),
                      color: Colors.amber[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            '6',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline4,
                          )
                      ),
                    ),
                  ),
                ),
                //ButtonMultiply
                Expanded(
                  flex:1,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: FlatButton(
                      onPressed: () => this.handleInput('*'),
                      color: Colors.deepPurple[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'X',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                //Button7
                Expanded(
                  flex:1,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: FlatButton(
                      onPressed: () => this.setState(() {
                        this._inputText = '${_inputText}7';
                      }),
                      color: Colors.amber[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            '7',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline4,
                          )
                      ),
                    ),
                  ),
                ),
                //Button8
                Expanded(
                  flex:1,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: FlatButton(
                      onPressed: () => this.setState(() {
                        this._inputText = '${_inputText}8';
                      }),
                      color: Colors.amber[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            '8',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline4,
                          )
                      ),
                    ),
                  ),
                ),
                //Button9
                Expanded(
                  flex:1,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: FlatButton(
                      onPressed: () => this.setState(() {
                        this._inputText = '${_inputText}9';
                      }),
                      color: Colors.amber[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            '9',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline4,
                          )
                      ),
                    ),
                  ),
                ),
                //ButtonDivide
                Expanded(
                  flex:1,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: FlatButton(
                      onPressed: () => this.handleInput('/'),
                      color: Colors.deepPurple[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '/',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                //ButtonDot
                Expanded(
                  flex:1,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: FlatButton(
                      onPressed: () => this.handleInput('.'),
                      color: Colors.amber[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            '.',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline4,
                          )
                      ),
                    ),
                  ),
                ),
                //Button0
                Expanded(
                  flex:1,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: FlatButton(
                      onPressed: () => this.setState(() {
                        this._inputText = '${_inputText}2';
                        this._outputText = this.evaluate();
                      }),
                      color: Colors.amber[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            '2',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline4,
                          )
                      ),
                    ),
                  ),
                ),
                //ButtonAdd
                Expanded(
                  flex:1,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: FlatButton(
                      onPressed: () => this.handleInput('-'),
                      color: Colors.deepPurple[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '-',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ),
                  ),
                ),
                //ButtonAdd
                Expanded(
                  flex:1,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: FlatButton(
                      onPressed: () => this.handleInput('+'),
                      color: Colors.deepPurple[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '+',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ),
                  ),
                ),


              ],
            )
          ],
        ),
      ),
    );
  }
  void handleInput(String input){
    String tmp = _inputText;
    try{
      this.evaluate();
      this.setState(() {
        this._inputText = '$_inputText$input';
      });
    }catch(ParseException){
      _inputText = tmp;
    }
  }
  String evaluate([String inputString]) => ExpressionEvaluator().eval(Expression.parse(inputString ?? _inputText),Map<String,dynamic>()).toString();
}
