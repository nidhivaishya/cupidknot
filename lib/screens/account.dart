import 'dart:io';

import 'package:cupidknot/screens/image.dart';
import 'package:cupidknot/screens/start.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  File _userImageFile;

  void _pickedImage(File image) {
    _userImageFile = image;
  }

  final introKey = GlobalKey<IntroductionScreenState>();

  var _chosenMonth;
  var _chosenDay;
  var _chosenYear;
  var _chosenReligion;
  int _value = 0;
  int _value2 = 0;
  int age = 0;
  var date = new DateTime.now().toString();

  int year = 0;

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) => StartScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    var dateParse = DateTime.parse(date);
    var formattedDate = "${dateParse.year}";
    int age = int.parse(formattedDate) - year;

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: Align(
        alignment: Alignment.topRight,
      ),

      pages: [
        PageViewModel(
          titleWidget: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    'assets/images/back.png',
                    height: 25,
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 19.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          bodyWidget: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Personal details',
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 135,
                        child: TextFormField(
                            decoration: InputDecoration(
                          labelText: 'First name',
                          labelStyle: TextStyle(color: Colors.black54),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.orange)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide()),
                        ))),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        width: 135,
                        child: TextFormField(
                            decoration: InputDecoration(
                          labelText: 'Last name',
                          labelStyle: TextStyle(color: Colors.black54),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.orange)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide()),
                        ))),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 70,
                    child: TextFormField(
                        decoration: InputDecoration(
                      labelText: 'Phone number',
                      labelStyle: TextStyle(color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.orange)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide()),
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Date of birth',
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.start,
                  ),
                  Spacer(),
                  Text(
                    'Age ',
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  ),
                  Text(
                    age.toString() == formattedDate ? '' : age.toString(),
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(15.0, 3.0, 5.0, 3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.5,
                        )),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _chosenMonth,
                        style: TextStyle(color: Colors.black),
                        icon: Icon(Icons.arrow_drop_down),
                        iconEnabledColor: Colors.grey,
                        items: <String>[
                          'January',
                          'February',
                          'March',
                          'April',
                          'May',
                          'June',
                          'July',
                          'August',
                          'September',
                          'October',
                          'November',
                          'December',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          );
                        }).toList(),
                        hint: Text(
                          "Month",
                          style: TextStyle(fontSize: 16),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            _chosenMonth = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(15.0, 3.0, 0.0, 3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.5,
                        )),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _chosenDay,
                        style: TextStyle(color: Colors.black),
                        icon: Icon(Icons.arrow_drop_down),
                        iconEnabledColor: Colors.grey,
                        items: <String>[
                          '1',
                          '2',
                          '3',
                          '4',
                          '5',
                          '6',
                          '7',
                          '8',
                          '9',
                          '10',
                          '11',
                          '12',
                          '13',
                          '14',
                          '15',
                          '16',
                          '17',
                          '18',
                          '19',
                          '20',
                          '21',
                          '22',
                          '23',
                          '24',
                          '25',
                          '26',
                          '27',
                          '28',
                          '29',
                          '30',
                          '31',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          );
                        }).toList(),
                        hint: Text(
                          "Day",
                          style: TextStyle(fontSize: 16),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            _chosenDay = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(15.0, 3.0, 0.0, 3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.5,
                        )),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _chosenYear,
                        style: TextStyle(color: Colors.black),
                        icon: Icon(Icons.arrow_drop_down),
                        iconEnabledColor: Colors.grey,
                        items: <String>[
                          '1980',
                          '1981',
                          '1982',
                          '1983',
                          '1984',
                          '1985',
                          '1986',
                          '1987',
                          '1988',
                          '1989',
                          '1990',
                          '1991',
                          '1992',
                          '1993',
                          '1994',
                          '1995',
                          '1996',
                          '1997',
                          '1998',
                          '1999',
                          '2000',
                          '2001',
                          '2002',
                          '2003'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          );
                        }).toList(),
                        hint: Text(
                          "Year",
                          style: TextStyle(fontSize: 16),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            _chosenYear = value;
                            year = int.parse(_chosenYear);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Religion',
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 70,
                    padding: EdgeInsets.fromLTRB(15.0, 3.0, 5.0, 3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.5,
                        )),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _chosenReligion,
                        style: TextStyle(color: Colors.black),
                        icon: Icon(Icons.arrow_drop_down),
                        iconEnabledColor: Colors.grey,
                        items: <String>['Hindu', 'Christian', 'Other']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          );
                        }).toList(),
                        hint: Text(
                          "Religion",
                          style: TextStyle(fontSize: 16),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            _chosenReligion = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Income',
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Enter your yearly income',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 70,
                    child: TextFormField(
                        decoration: InputDecoration(
                      labelText: 'Income',
                      hintText: 'eg. 250,000',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                      labelStyle: TextStyle(color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.orange)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide()),
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                ],
              )
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    'assets/images/back.png',
                    height: 25,
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 19.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          bodyWidget: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Profile Picture',
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text('Upload your picture'),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              UserImagePicker(_pickedImage),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Gender',
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text('Select your gender'),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => setState(() => _value2 = 0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: _value2 == 0
                              ? Colors.yellow[600]
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10)),
                      height: 110,
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/male.png',
                            height: 50,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Male',
                            style: TextStyle(
                              color: _value2 == 0 ? Colors.black : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => _value2 = 1),
                    child: Container(
                      decoration: BoxDecoration(
                          color: _value2 == 1
                              ? Colors.yellow[600]
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10)),
                      height: 110,
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/female.png',
                            height: 50,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Female',
                            style: TextStyle(
                              color: _value2 == 1 ? Colors.black : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    'assets/images/back.png',
                    height: 25,
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Text(
                    'Account Privacy',
                    style: TextStyle(
                      fontSize: 19.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          bodyWidget: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Privacy',
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text('Your Profile Privacy'),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset('assets/images/security.png'),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => setState(() => _value = 0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: _value == 0
                              ? Colors.yellow[600]
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10)),
                      height: 60,
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.lock,
                            color: _value == 0 ? Colors.black : Colors.grey,
                          ),
                          Text(
                            '  Private',
                            style: TextStyle(
                              color: _value == 0 ? Colors.black : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => _value = 1),
                    child: Container(
                      decoration: BoxDecoration(
                          color: _value == 1
                              ? Colors.yellow[600]
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10)),
                      height: 60,
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.public,
                            color: _value == 1 ? Colors.black : Colors.grey,
                          ),
                          Text(
                            '  Public',
                            style: TextStyle(
                              color: _value == 1 ? Colors.black : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  'An Instagram bio is a small area under your username where you can share some details about yourself or your brand. Your Instagram bio can include a brief self or brand description, contact information, emojis, hashtafs and more.',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context),
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text('Skip',
          style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: 18)),

      next: SizedBox(
        height: 48,
        width: MediaQuery.of(context).size.width - 200,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.grey[850],
              border: Border.all(color: Colors.grey[850]),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Next',
              style: TextStyle(color: Colors.white, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      done: SizedBox(
        height: 48,
        width: MediaQuery.of(context).size.width - 200,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.grey[850],
              border: Border.all(color: Colors.grey[850]),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Submit Profile',
              style: TextStyle(color: Colors.white, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.grey,
        activeSize: Size(10.0, 10.0),
        activeColor: Colors.black,
      ),
    );
  }
}
