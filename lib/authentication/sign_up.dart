import 'package:flutter/material.dart';
import 'sign_in.dart'; // Import the sign-in page for navigation

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for form fields
  TextEditingController firstNameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;
  String? selectedGender;

  final List<String> days = List.generate(31, (index) => (index + 1).toString());
  final List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  final List<String> years =
      List.generate(100, (index) => (DateTime.now().year - index).toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a new account'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // First Name and Surname fields in a responsive Row
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Enter first name' : null,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: surnameController,
                      decoration: InputDecoration(
                        labelText: 'Surname',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Enter surname' : null,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),

              // Date of Birth Dropdowns
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedDay,
                      decoration: InputDecoration(
                        labelText: 'Day',
                        border: OutlineInputBorder(),
                      ),
                      items: days
                          .map((day) => DropdownMenuItem(
                                value: day,
                                child: Text(day),
                              ))
                          .toList(),
                      onChanged: (value) => setState(() {
                        selectedDay = value;
                      }),
                      validator: (value) =>
                          value == null ? 'Select day' : null,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedMonth,
                      decoration: InputDecoration(
                        labelText: 'Month',
                        border: OutlineInputBorder(),
                      ),
                      items: months
                          .map((month) => DropdownMenuItem(
                                value: month,
                                child: Text(month),
                              ))
                          .toList(),
                      onChanged: (value) => setState(() {
                        selectedMonth = value;
                      }),
                      validator: (value) =>
                          value == null ? 'Select month' : null,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedYear,
                      decoration: InputDecoration(
                        labelText: 'Year',
                        border: OutlineInputBorder(),
                      ),
                      items: years
                          .map((year) => DropdownMenuItem(
                                value: year,
                                child: Text(year),
                              ))
                          .toList(),
                      onChanged: (value) => setState(() {
                        selectedYear = value;
                      }),
                      validator: (value) =>
                          value == null ? 'Select year' : null,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),

              // Gender Selection
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Gender', style: TextStyle(fontSize: 12)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: RadioListTile<String>(
                            title: Text('Female'),
                            value: 'Female',
                            groupValue: selectedGender,
                            onChanged: (value) => setState(() {
                              selectedGender = value;
                            }),
                          ),
                        ),
                        Flexible(
                          child: RadioListTile<String>(
                            title: Text('Male'),
                            value: 'Male',
                            groupValue: selectedGender,
                            onChanged: (value) => setState(() {
                              selectedGender = value;
                            }),
                          ),
                        ),
                        Flexible(
                          child: RadioListTile<String>(
                            title: Text('Custom'),
                            value: 'Custom',
                            groupValue: selectedGender,
                            onChanged: (value) => setState(() {
                              selectedGender = value;
                            }),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16),

              // Email or Mobile Number Field
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Mobile number or email address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Enter mobile number or email' : null,
              ),

              SizedBox(height: 16),

              // Password and Confirm Password Fields
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) =>
                    value!.isEmpty ? 'Enter a password' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) =>
                    value != passwordController.text
                        ? 'Passwords do not match'
                        : null,
              ),

              SizedBox(height: 32),

              // Sign Up Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Sign Up Successful!')));

                    // Navigate to the sign-in page
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignInPage()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Sign Up'),
              ),

              SizedBox(height: 16),

              // Already Have an Account Button
              TextButton(
                onPressed: () {
                  // Navigate back to the sign-in page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
                  );
                },
                child: Text(
                  'Already have an account?',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
