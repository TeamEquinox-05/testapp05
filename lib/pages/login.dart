import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  TabController? tabController;
  bool isEmailSelected = true; // Track active tab

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);

    // Listen for tab changes
    tabController?.addListener(() {
      setState(() {
        isEmailSelected =
            tabController?.index == 0; // Check which tab is active
      });
    });
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 100),

              // Heading
              Container(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: "WorkSans",
                      ),
                    ),
                    Text(
                      'Sign in to continue',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Tab Bar
              TabBar(
                controller: tabController,
                tabs: const [
                  Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.email),
                        SizedBox(width: 8), // Spacing between icon and text
                        Text('Email'),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.phone),
                        SizedBox(width: 8),
                        Text('Phone Number'),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Dynamic Form Fields
              if (isEmailSelected)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 8.0, bottom: (8.0)),
                      child: Text('Email',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          )),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        hintText: 'Enter Your Email',
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 8.0, bottom: (8.0)),
                      child: Text('Phone Number',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          )),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        hintText: 'Enter Your Phone Number',
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 20),
                  ],
                ),

              // Password Field (Common for both tabs)
              
              Column(
                   crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const Padding(
                  
                      padding: EdgeInsets.only(left: 8.0, bottom: (8.0)),
                      child: Text('Phone Number',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          )),
                    
                ),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      hintText: 'Enter Your Password',
                    ),
                    obscureText: true,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Sign Up
              Row(
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      // Navigate to register page
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
