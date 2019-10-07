import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_db/admission/components/admission_verify.dart';

class AdmissionForm extends StatefulWidget {
  @override
  _AdmissionFormState createState() => _AdmissionFormState();
}

class _AdmissionFormState extends State<AdmissionForm> {
  final _formKey = GlobalKey<FormState>();
  static const List<String> _formNamesHi = [
    "क्रमांक",
    "प्रवेश संख्या",
    "प्रवेश तिथि",
    "छात्र/छात्रा का नाम",
    "पिता का नाम",
    "माता का नाम",
    "लिंग",
    "ग्राम",
    "वार्ड संख्या",
    "जाति",
    "जन्मतिथि",
    "अल्पसंख्यक",
    "दिव्यांग",
    "आधार नंबर",
    "मोबाइल नंबर",
    "बैंक बचत खाता संख्या",
    "बैंक कोड",
    "खाताधारक का नाम",
    "वार्षिक आय"
  ];

  static const List<String> _formNamesEn = [
    "Serial No.",
    "Admission No.",
    "Admission Date",
    "Student Name",
    "Father Name",
    "Mother Name",
    "Gender",
    "Village",
    "Ward",
    "Category",
    "Date of Birth",
    "Minority",
    "Divyang",
    "Aadhar No.",
    "Mobile No.",
    "IFSC Code",
    "Bank Account No.",
    "Account Holder Name",
    "Annual Income"
  ];

  int _serialNo;
  int _admissionNo;
  DateTime _admissionDate;
  String _studentName;
  String _fatherName;
  String _motherName;
  String _gender;
  String _village;
  String _ward;
  String _category;
  DateTime _dob;
  int _minority;
  int _divyang;
  int _aadharNo;
  int _mobileNo;
  int _ifscCode;
  int _bankAccountNo;
  String _bankAccountName;
  int _annualIncome;

  var _serialNoController = TextEditingController();
  var _admissionNoController = TextEditingController();
  var _admissionDateController = TextEditingController();
  var _studentNameController = TextEditingController();
  var _fatherNameController = TextEditingController();
  var _motherNameController = TextEditingController();
  var _genderController = TextEditingController();
  var _villageController = TextEditingController();
  var _wardController = TextEditingController();
  var _categoryController = TextEditingController();
  var _dobController = TextEditingController();
  var _minorityController = TextEditingController();
  var _divyangController = TextEditingController();
  var _aadharNoController = TextEditingController();
  var _mobileNoController = TextEditingController();
  var _ifscCodeController = TextEditingController();
  var _bankAccountNoController = TextEditingController();
  var _bankAccountNameController = TextEditingController();
  var _annualIncomeController = TextEditingController();

  final FocusNode _serialNoFocus = FocusNode();
  final FocusNode _admissionNoFocus = FocusNode();
  final FocusNode _admissionDateFocus = FocusNode();
  final FocusNode _studentNameFocus = FocusNode();
  final FocusNode _fatherNameFocus = FocusNode();
  final FocusNode _motherNameFocus = FocusNode();
  final FocusNode _genderFocus = FocusNode();
  final FocusNode _villageFocus = FocusNode();
  final FocusNode _wardFocus = FocusNode();
  final FocusNode _categoryFocus = FocusNode();
  final FocusNode _dobFocus = FocusNode();
  final FocusNode _minorityFocus = FocusNode();
  final FocusNode _divyangFocus = FocusNode();
  final FocusNode _aadharNoFocus = FocusNode();
  final FocusNode _mobileNoFocus = FocusNode();
  final FocusNode _ifscCodeFocus = FocusNode();
  final FocusNode _bankAccountNoFocus = FocusNode();
  final FocusNode _bankAccountNameFocus = FocusNode();
  final FocusNode _annualIncomeFocus = FocusNode();

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }



  TextFormField _serialField(BuildContext context) {
    return TextFormField(
      controller: _serialNoController,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      focusNode: _serialNoFocus,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _serialNoFocus, _admissionNoFocus);
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter Serial Number';
        }
        return null;
      },
      onSaved: (value) {
        _serialNo=int.tryParse(value);
        print("Serial No: "+ _serialNo.toString() + "\n");
      },
      inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
      decoration: InputDecoration(
        labelText: _formNamesHi[0],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.blue),
        ),
      ),
    );
  }

  TextFormField _admissionNoField(BuildContext context) {
    return TextFormField(
      controller: _admissionNoController,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      focusNode: _admissionNoFocus,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _admissionNoFocus, _admissionDateFocus);
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter Admission Number';
        }
        return null;
      },
      onSaved: (value) {
        _admissionNo=int.tryParse(value);
        print("Admission No: "+ _admissionNo.toString() + "\n");

        
      },
      inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
      decoration: InputDecoration(
        labelText: _formNamesHi[1],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.blue),
        ),
      ),
    );
  }

  TextFormField _admissionDateField(BuildContext context) {
    return TextFormField(
      controller: _admissionDateController,
      maxLength: 10,
      maxLengthEnforced: true,
      keyboardType: TextInputType.datetime,
      textInputAction: TextInputAction.next,
      focusNode: _admissionDateFocus,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _admissionDateFocus, _studentNameFocus);
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter Admission Date';
        }
        return null;
      },
      onSaved: (value) {
        String date = value.substring(0, 2);
        String month = value.substring(3, 5);
        String year = value.substring(6);
        _admissionDate = DateTime.parse((year + "-" + month + "-" + date));
        print("Admission Date: "+ _admissionDate.toString() + "\n");

      },
      decoration: InputDecoration(
        labelText: _formNamesHi[2],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.blue),
        ),
      ),
    );
  }

  TextFormField _studentNameField(BuildContext context) {
    return TextFormField(
      controller: _studentNameController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      focusNode: _studentNameFocus,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _studentNameFocus, _fatherNameFocus);
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter Student Name';
        }
        return null;
      },
      onSaved: (value) {
        _studentName=value;
        print("Student Name: "+ _studentName.toString() + "\n"); 
      },
      // inputFormatters: [WhitelistingTextInputFormatter(RegExp("[a-zA-z0-9]"))],
      decoration: InputDecoration(
        labelText: _formNamesHi[3],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.blue),
        ),
      ),
    );
  }

  TextFormField _fatherNameField(BuildContext context) {
    return TextFormField(
      controller: _fatherNameController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      focusNode: _fatherNameFocus,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _fatherNameFocus, _motherNameFocus);
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter Father Name';
        }
        return null;
      },
      onSaved: (value) {
         _fatherName=value;
        print("Father Name: "+ _fatherName.toString() + "\n"); 
      },
      // inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
      decoration: InputDecoration(
        labelText: _formNamesHi[4],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.blue),
        ),
      ),
    );
  }

  TextFormField _motherNameField(BuildContext context) {
    return TextFormField(
      controller: _motherNameController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      focusNode: _motherNameFocus,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _motherNameFocus, _genderFocus);
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter Mother Name';
        }
        return null;
      },
      onSaved: (value) {
         _motherName=value;
        print("Mother Name: "+ _motherName.toString() + "\n"); 
      },
      // inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
      decoration: InputDecoration(
        labelText: _formNamesHi[5],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.blue),
        ),
      ),
    );
  }

  TextFormField _genderField(BuildContext context) {
    return TextFormField(
      controller: _genderController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      focusNode: _genderFocus,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _genderFocus, _villageFocus);
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter Gender';
        }
        return null;
      },
      onSaved: (value) {
        _gender=value;
        print("Gender: "+ _gender);
      },
      // inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
      decoration: InputDecoration(
        labelText: _formNamesHi[6],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.blue),
        ),
      ),
    );
  }

  TextFormField _villageField(BuildContext context) {
    return TextFormField(
      controller: _villageController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      focusNode: _villageFocus,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _villageFocus, _wardFocus);
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter Village Name';
        }
        return null;
      },
      onSaved: (value) {
          _village=value;
        print("Village Name: "+ _village.toString() + "\n"); 
      },
      // inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
      decoration: InputDecoration(
        labelText: _formNamesHi[7],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.blue),
        ),
      ),
    );
  }

  TextFormField _wardField(BuildContext context) {
    return TextFormField(
      controller: _wardController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      focusNode: _wardFocus,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _wardFocus, _categoryFocus);
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter Ward Number';
        }
        return null;
      },
      onSaved: (value) {
  _ward=value;
        print("Ward Number: "+ _ward.toString() + "\n");       },
      // inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
      decoration: InputDecoration(
        labelText: _formNamesHi[8],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.blue),
        ),
      ),
    );
  }

  TextFormField _categroyField(BuildContext context) {
    return TextFormField(
      controller: _categoryController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      focusNode: _categoryFocus,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _categoryFocus, _dobFocus);
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter Category';
        }
        return null;
      },
      onSaved: (value) {
  _category=value;
        print("Category Name: "+ _category.toString() + "\n");       },
      // inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
      decoration: InputDecoration(
        labelText: _formNamesHi[9],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.blue),
        ),
      ),
    );
  }

  TextFormField _dOBField(BuildContext context) {
    return TextFormField(
      controller: _dobController,
      maxLength: 10,
      maxLengthEnforced: true,
      keyboardType: TextInputType.datetime,
      textInputAction: TextInputAction.next,
      focusNode: _dobFocus,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _dobFocus, _minorityFocus);
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter Date of Birth';
        }
        return null;
      },
      onSaved: (value) {
        String date = value.substring(0, 2);
        String month = value.substring(3, 5);
        String year = value.substring(6);
        _dob = DateTime.parse((year + "-" + month + "-" + date));
        print("DOB: "+ _dob.toString()+ "\n");
      },
      // inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
      decoration: InputDecoration(
        labelText: _formNamesHi[10],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.blue),
        ),
      ),
    );
  }

  TextFormField _minorityField(BuildContext context) {
    return TextFormField(
      controller: _minorityController,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      focusNode: _minorityFocus,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _minorityFocus, _divyangFocus);
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter 0= Minority, 1= Not Minority';
        }
        return null;
      },
      onSaved: (value) {
        _minority=int.tryParse(value);
        print("Minority: "+ _minority.toString() + "\n");
      },
      // inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
      decoration: InputDecoration(
        labelText: _formNamesHi[11],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.blue),
        ),
      ),
    );
  }

  TextFormField _divyangField(BuildContext context) {
    return TextFormField(
      controller: _divyangController,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      focusNode: _divyangFocus,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _divyangFocus, _aadharNoFocus);
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter 0= Divyang, 1= Not Divyang';
        }
        return null;
      },
      onSaved: (value) {
        _divyang=int.tryParse(value);
        print("Divyang: "+ _divyang.toString() + "\n");
       },
      // inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
      decoration: InputDecoration(
        labelText: _formNamesHi[12],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.blue),
        ),
      ),
    );
  }

  TextFormField _aadharNoField(BuildContext context) {
    return TextFormField(
      controller: _aadharNoController,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      focusNode: _aadharNoFocus,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _aadharNoFocus, _mobileNoFocus);
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter Aadhar Number';
        }
        return null;
      },
      onSaved: (value) {
          _aadharNo=int.tryParse(value);
        print("Aadhar No: "+ _aadharNo.toString() + "\n");
      },
      inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
      decoration: InputDecoration(
        labelText: _formNamesHi[13],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.blue),
        ),
      ),
    );
  }

  TextFormField _mobileNoField(BuildContext context) {
    return TextFormField(
      controller: _mobileNoController,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      focusNode: _mobileNoFocus,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _mobileNoFocus, _bankAccountNoFocus);
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter Mobile Number';
        }
        return null;
      },
      onSaved: (value) {
         _mobileNo=int.tryParse(value);
        print("Mobile No: "+ _mobileNo.toString() + "\n");
      },
      inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
      decoration: InputDecoration(
        labelText: _formNamesHi[14],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.blue),
        ),
      ),
    );
  }

  TextFormField _bankAccountNoField(BuildContext context) {
    return TextFormField(
      controller: _bankAccountNoController,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      focusNode: _bankAccountNoFocus,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _bankAccountNoFocus, _ifscCodeFocus);
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter Bank Account Number';
        }
        return null;
      },
      onSaved: (value) {
          _bankAccountNo=int.tryParse(value);
        print("Bank Account No: "+ _bankAccountNo.toString() + "\n");
    
      },
      inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
      decoration: InputDecoration(
        labelText: _formNamesHi[15],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.blue),
        ),
      ),
    );
  }

  TextFormField _iFSCField(BuildContext context) {
    return TextFormField(
      controller: _ifscCodeController,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      focusNode: _ifscCodeFocus,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _ifscCodeFocus, _bankAccountNameFocus);
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter IFSC Number';
        }
        return null;
      },
      onSaved: (value) {
          _ifscCode=int.tryParse(value);
        print("Bank Code: "+ _ifscCode.toString() + "\n");
    
      },
      inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
      decoration: InputDecoration(
        labelText: _formNamesHi[16],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.blue),
        ),
      ),
    );
  }

  TextFormField _bankAccountNameField(BuildContext context) {
    return TextFormField(
      controller: _bankAccountNameController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      focusNode: _bankAccountNameFocus,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, _bankAccountNameFocus, _annualIncomeFocus);
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter Account Holder Name';
        }
        return null;
      },
      onSaved: (value) {
          _bankAccountName=value;
        print("Aadhar No: "+ _bankAccountName.toString() + "\n");
    
      },
      // inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
      decoration: InputDecoration(
        labelText: _formNamesHi[17],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.blue),
        ),
      ),
    );
  }

  TextFormField _annualIncomeField(BuildContext context) {
    return TextFormField(
      controller: _annualIncomeController,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      focusNode: _annualIncomeFocus,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please Enter Annual Income';
        }
        return null;
      },
      onSaved: (value) {
          _annualIncome=int.tryParse(value);
        print("Annual Income: "+ _annualIncome.toString() + "\n");      },
      inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
      decoration: InputDecoration(
        labelText: _formNamesHi[18],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.blue),
        ),
      ),
    );
  }

  Padding submitButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        onPressed: () {
          // Validate returns true if the form is valid, or false
          // otherwise.
          if (_formKey.currentState.validate()) {
            // If the form is valid, display a Snackbar.
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('Processing Data')));
          }
        },
        child: Text('Submit'),
      ),
    );
  }


  Material submit(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.blue,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 00.0),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            // If the form is valid, display a Snackbar.
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('Processing Data')));
            _formKey.currentState.save();   
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AdmissionVerify(name: _studentName,)));       
          }
//                        print(_principalName+_schoolID.toString()+_schoolName+_block+_districtName+_phoneNo.toString());
//                      _registrationPerfManage.saveRegistration(_schoolID, _schoolName, _block, _districtName, _principalName, _phoneNo);
        },
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text("Submit",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Card(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Wrap(
                  spacing: 0,
                  runSpacing: 20,
                  children: <Widget>[
                    // _serialField(context),
                    // _admissionNoField(context),
                    // _admissionDateField(context),
                    _studentNameField(context),
                    // _fatherNameField(context),
                    // _motherNameField(context),
                    // _genderField(context),
                    // _villageField(context),
                    // _wardField(context),
                    // _categroyField(context),
                    // _dOBField(context),
                    // _minorityField(context),
                    // _divyangField(context),
                    // _aadharNoField(context),
                    // _mobileNoField(context),
                    // _bankAccountNoField(context),
                    // _iFSCField(context),
                    // _bankAccountNameField(context),
                    // _annualIncomeField(context),
                    submit(context),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
