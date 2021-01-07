import 'package:cargaspoint/HelperFunction.dart';
import 'package:cargaspoint/components/constants.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {

   final history;

  const HistoryScreen({Key key, this.history}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();

}

class _HistoryScreenState extends State<HistoryScreen> {

  List h ;

  Color optionColor = Colors.blue[50];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(mounted){
      setState(() {
        h = widget.history;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    var width = HelperFunction().getWidth(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
      ),
      body: ListView.builder(
        itemCount: h.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Row(
                            children: [
                              Container(
                                width: width * 0.4,
                                color: optionColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Type'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(h[index]['servicingType'].toString()),
                              )
                            ],
                          ),
                        ),
                        Container(height: 1, color: Colors.blue,),
                        Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Row(
                            children: [
                              Container(
                                width: width * 0.4,
                                color: optionColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Date Of Servicing'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(HelperFunction().getDateStamp(h[index]['DateOfServicing']).toString()),
                              )
                            ],
                          ),
                        ),
                        Container(height: 1, color: Colors.blue,),
                        Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Row(
                            children: [
                              Container(
                                width: width * 0.4,
                                color: optionColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('TotalBill'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(h[index]['totalBill'].toString()),
                              )
                            ],
                          ),
                        ),
                        Container(height: 1, color: Colors.blue,),

                    ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
