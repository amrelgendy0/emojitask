import 'package:flutter/material.dart';

class FirstPollScreen extends StatefulWidget {
  @override
  _FirstPollScreenState createState() => _FirstPollScreenState();
}

class _FirstPollScreenState extends State<FirstPollScreen> {
  bool isfirst;
  @override
  void initState() {
    isfirst = true;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (isfirst) {
      _oo.addAll([
        SizedBox(
          child: _choiseTextField(0),
        ),
        SizedBox(
          child: _choiseTextField(1),
        ),
      ]);
      isfirst = false;
    }
    super.didChangeDependencies();
  }

  GlobalKey<FormState> _Globalkey = GlobalKey<FormState>();
  final List<String> _ChoisesToSend = [];
  final List<Widget> _oo = [];
  final int numOfChoise = 4;
  Widget build(BuildContext context) {
    return Form(
      key: _Globalkey,
      child: Scaffold(
          backgroundColor: Colors.red[200],
          appBar: AppBar(),
          body: ListView(
            children: [
              QeustionTextField(
                hint: 'Type Your Question..',
                onSaved: (aa) {
                  _ChoisesToSend.add(aa);
                },
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(6))),
                child: Column(
                  children: [
                    Column(children: _oo),
                    if (counter <= numOfChoise - 3)
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            add();
                          });
                        },
                      ),
                    FlatButton(
                        onPressed: () {
                          //todo (List of Question and choises Question is always index 0)
                          if (_Globalkey.currentState.validate()) {
                            _Globalkey.currentState.save();
                            print(_ChoisesToSend);
                          }
                        },
                        child: const Text("Send"))
                  ],
                ),
                padding: const EdgeInsets.all(10),
                margin: EdgeInsets.only(
                    top: 20,
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.3),
              ),
            ],
          )),
    );
  }

  void add() {
    _oo.add(_choiseTextField(_oo.length));
  }

  void remove(int index) {
    _oo.replaceRange(index, index + 1, [const SizedBox()]);
  }

  int get counter {
    int _count = 0;
    _oo.forEach((element) {
      if (element.toString().startsWith("Padding")) {
        _count++;
      }
    });
    return _count;
  }

  Widget _choiseTextField(int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        validator: (text) {
          if (text.trim() == '' && index < 2) {
            return  'Must not be embty';
          }
        },
        decoration: InputDecoration(
          fillColor: Colors.grey.withOpacity(.3),
          filled: true,
          suffixIcon: index >= 2
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      remove(index);
                    });
                  },
                  child: const Icon(
                    Icons.clear,
                    color: Colors.red,
                  ),
                )
              : const SizedBox(),
          hintText: 'Type a Choise',
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
        onSaved: (aa) {
          if (aa.trim() != '') {
            _ChoisesToSend.add(aa);
          }
        },
      ),
    );
  }
}

class QeustionTextField extends StatelessWidget {
  final String hint;
  final Function onSaved;

  QeustionTextField({@required this.onSaved, @required this.hint});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        maxLines: 2,
        validator: (String value) {
          if (value.trim() == '') {
            return 'Can\'t Be Empty !';
          }
        },
        onSaved: onSaved,
        decoration: InputDecoration(
          hintText: hint,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.black)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.black)),
        ),
      ),
    );
  }
}
