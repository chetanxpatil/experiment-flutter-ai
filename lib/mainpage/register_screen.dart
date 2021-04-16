import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  DateTime selectedDate;

  TextEditingController clr10 = TextEditingController();
  TextEditingController clr9 = TextEditingController();
  TextEditingController clr8 = TextEditingController();
  TextEditingController clr7 = TextEditingController();
  TextEditingController clr5 = TextEditingController();
  TextEditingController clr6 = TextEditingController();
  TextEditingController clr = TextEditingController();
  TextEditingController clr2 = TextEditingController();
  TextEditingController clr3 = TextEditingController();
  TextEditingController clr4 = TextEditingController();

  Color hoverColor = Colors.black;

  bool isTapped1 = false;
  bool isTapped2 = false;
  bool isTapped3 = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric( vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: clr5,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Owner Name",
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: clr6,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Email",
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: clr7,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Phone no",
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: clr8,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "password",
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: clr,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Date of birth",
                    suffixIcon: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Icon(Icons.calendar_today)),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      controller: clr2,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Register as",
                        suffixIcon: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              setState(() {
                                isTapped1 = !isTapped1;
                              });
                            },
                            child: Icon(Icons.arrow_drop_down)),
                      ),
                    ),
                    isTapped1
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    clr2.text = "B2B (Business to Business)";
                                    isTapped1 = false;
                                  });
                                },
                                child: Text(
                                  "B2B (Business to Business)",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black38),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    clr2.text = "B2S (Business to Service)";
                                    isTapped1 = false;
                                  });
                                },
                                child: Text(
                                  "B2S (Business to Service)",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black38),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InkWell(
                                onHover: (val) {
                                  setState(() {
                                    hoverColor =
                                        val ? Colors.green : Colors.black38;
                                  });
                                },
                                onTap: () {
                                  setState(() {
                                    clr2.text = "B2S (Business to Consumer)";
                                    isTapped1 = false;
                                  });
                                },
                                child: Text(
                                  "B2C (Business to Consumer)",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black38),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      controller: clr3,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Gender",
                        suffixIcon: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              setState(() {
                                isTapped2 = !isTapped2;
                              });
                            },
                            child: Icon(Icons.arrow_drop_down)),
                      ),
                    ),
                    isTapped2
                        ? Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    clr3.text = "Male";
                                    isTapped2 = false;
                                  });
                                },
                                child: Text(
                                  "Male",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black38),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    clr3.text = "Female";
                                    isTapped2 = false;
                                  });
                                },
                                child: Text(
                                  "Female",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black38),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    clr3.text = "Others";
                                    isTapped2 = false;
                                  });
                                },
                                child: Text(
                                  "Others",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black38),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: clr4,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Language",
                        suffixIcon: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              setState(() {
                                isTapped3 = !isTapped3;
                              });
                            },
                            child: Icon(Icons.arrow_drop_down)),
                      ),
                    ),
                    isTapped3
                        ? Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    clr4.text = "English";
                                    isTapped3 = false;
                                  });
                                },
                                child: Text(
                                  "English",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black38),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    clr4.text = "Hindi";
                                    isTapped3 = false;
                                  });
                                },
                                child: Text(
                                  "Hindi",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black38),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    clr4.text = "Marathi";
                                    isTapped3 = false;
                                  });
                                },
                                child: Text(
                                  "Marathi",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black38),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
              SizedBox(height: 5,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  controller: clr10,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Categories",
                    suffixIcon: Icon(Icons.arrow_drop_down),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: clr9,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Ref code",
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () async {
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        clr.text =
            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
      });
  }
}
