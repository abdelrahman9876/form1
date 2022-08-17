
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_range/time_range.dart';




class form1 extends StatefulWidget {
  @override
  _form1State createState() => _form1State();
}

class _form1State extends State<form1> {//class Home extends GetView<StoreController>{}

  static const orange = Colors.white;
  static const dark = Colors.blue;
  static const double leftPadding = 50;

  final _defaultTimeRange = TimeRangeResult(
    TimeOfDay(hour: 14, minute: 50),
    TimeOfDay(hour: 15, minute: 20),
  );
  TimeRangeResult? _timeRange;

  @override
  void initState() {
    super.initState();
    _timeRange = _defaultTimeRange;
  }
  final _formKey = GlobalKey<FormState>();
  final _openDropDownProgKey = GlobalKey<DropdownSearchState<int>>();
  final _multiKey = GlobalKey<DropdownSearchState<String>>();
  final _popupBuilderKey = GlobalKey<DropdownSearchState<String>>();
  final _popupCustomValidationKey = GlobalKey<DropdownSearchState<int>>();
  final _userEditTextController = TextEditingController(text: 'Mrs');
  // final myKey = GlobalKey<DropdownSearchState<MultiLevelString>>();
  List<String> myitems1=['القاهرة','اسكندرية','القليوبية'];
    List<String> myitems2=['المعادى','الدقى','الهرم'];
  List<String> myitems3=['نقطة 1','نقطة2','نقطة3'];
    List<String> myitems4=['السبت','الاحد','الاثنين','الثلاثاء','الاربعاء','الخميس','الجمعه'];

  List<String> myitems5=['9-10','11-12','1-3'];
  bool? _popupBuilderSelection = false;
    
    



  @override
  Widget build(BuildContext context) {

    void _handleCheckBoxState({bool updateState = true}) {
      var selectedItem =
          _popupBuilderKey.currentState?.popupGetSelectedItems ?? [];
      var isAllSelected =
          _popupBuilderKey.currentState?.popupIsAllItemSelected ?? false;
      _popupBuilderSelection =
          selectedItem.isEmpty ? false : (isAllSelected ? true : null);

      if (updateState) setState(() {});
    }

    _handleCheckBoxState(updateState: false);

     return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0.0,),
      body: Padding(
        
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: EdgeInsets.all(4),
            children: <Widget>[
               Image.asset('assets/images/Group5.png',),
               SizedBox(height: 30.0,),
              Container(
                child: Text('التفضيلات',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w900),textAlign: TextAlign.center,),
              ),
              Divider(),
              Row(
                children: [
                Expanded(
                    child: DropdownSearch<String>.multiSelection(
                      clearButtonProps: ClearButtonProps(isVisible: true),
                      items: myitems1,
                    ),
                  ),
                
                  Padding(padding: EdgeInsets.all(4)),
                  
            
                  Expanded(
                    child: Text('اختر المحافظة',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,),textAlign: TextAlign.right,) ),
                  ],
              ),
            
              Padding(padding: EdgeInsets.all(8)),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<String>.multiSelection(
                      clearButtonProps: ClearButtonProps(isVisible: true),
                      items: myitems2,
                    ),
                  ),
                
                                    Padding(padding: EdgeInsets.all(4)),
            
                  Expanded(
                    child: Text('اختر المنطقة',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),textAlign: TextAlign.right,) ),
                  ],
              ),
            
              Padding(padding: EdgeInsets.all(8)),
              Row(
                children: [
            Expanded(
                    child: DropdownSearch<String>.multiSelection(
                      clearButtonProps: ClearButtonProps(isVisible: true),
                      items:myitems3 ,
                    ),
                  ),
               
                 Padding(padding: EdgeInsets.all(4)),
            
                  Expanded(
                    child: Text('اختر النقطة',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),textAlign: TextAlign.right,) ),
                   ],
              ),
              Divider(),
                            Padding(padding: EdgeInsets.all(10)),

               Row(
                children: [
            
                    Container(
                      width: 250,
              height: 50,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime(1969, 1, 1),
                onDateTimeChanged: (DateTime newDateTime) {
                  print(newDateTime);
                  // Do something
                },
              ),
            ),
                  
               
                  Padding(padding: EdgeInsets.all(4)),
                  Expanded(
                    child: Text('اختر اليوم',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),textAlign: TextAlign.right,) ),
                  
                   ],
              ),
              Padding(padding: EdgeInsets.all(10)),

              
            
            SizedBox(height: 20),
            TimeRange(
              fromTitle: Text(
                'FROM',
                style: TextStyle(
                  fontSize: 14,
                  color: dark,
                  fontWeight: FontWeight.w600,
                ),
              ),
              toTitle: Text(
                'TO',
                style: TextStyle(
                  fontSize: 14,
                  color: dark,
                  fontWeight: FontWeight.w600,
                ),
              ),
              titlePadding: leftPadding,
              textStyle: TextStyle(
                fontWeight: FontWeight.normal,
                color: dark,
              ),
              activeTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: orange,
              ),
              borderColor: dark,
              activeBorderColor: dark,
              backgroundColor: Colors.transparent,
              activeBackgroundColor: dark,
              firstTime: TimeOfDay(hour: 8, minute: 00),
              lastTime: TimeOfDay(hour: 20, minute: 00),
              initialRange: _timeRange,
              timeStep: 10,
              timeBlock: 30,
              onRangeCompleted: (range) => setState(() => _timeRange = range),
            ),
            SizedBox(height: 30),
            if (_timeRange != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: leftPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Selected Range: ${_timeRange!.start.format(context)} - ${_timeRange!.end.format(context)}',
                      style: TextStyle(fontSize: 20, color: dark),
                    ),
                    SizedBox(height: 20),
                    
                  ],
                ),
              ),
          
              Padding(padding: EdgeInsets.all(30)),
            
              ElevatedButton(
                onPressed: () {
                  _openDropDownProgKey.currentState?.changeSelectedItem(100);
                },
                child: Text('حفظ',style: TextStyle(fontSize: 25.0),),
              ),
             
              ///************************[multiLevel items example]********************************///
              Padding(padding: EdgeInsets.all(8)),
              
              ],
          ),
        ),
      ),
    
    );
  }
 
  
  }
  

