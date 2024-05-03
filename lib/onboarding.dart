import 'package:flutter/material.dart';
import 'package:mad_lab5/homepage.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  bool _isChecked = false;
  bool _isOTPStage = false;
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Image.asset('images/UPMlogo.jpg', height: 100),
              const SizedBox(height: 30),
              const Text("Welcome !",
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.w900)),
              Card(
                color: _isOTPStage
                    ? Colors.white
                    : const Color.fromARGB(255, 255, 216, 216),
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                margin: const EdgeInsets.all(10),
                child: _isOTPStage ? buildOtpUI() : buildMobileNumberUI(),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text.rich(
                  TextSpan(
                    text: 'Disclaimer',
                    style: TextStyle(color: Colors.blue),
                    children: <TextSpan>[
                      TextSpan(text: ' | '),
                      TextSpan(
                          text: 'Privacy Statement',
                          style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  'Copyright UPM & Kejuteraan Minyak Sawit \n CSS Sdn. Bhd.',
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOtpUI() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: const Row(
            children: [
              Expanded(
                child: Text(
                  "Enter the activation code you received via SMS.",
                  style: TextStyle(fontSize: 18),
                  softWrap: true,
                ),
              ),
              SizedBox(width: 10),
              Icon(Icons.info_outline, size: 23),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'OTP',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            maxLength: 6,
          ),
        ),
        const Center(
          child: Text.rich(
            TextSpan(
              text: 'Did not receive?',
              children: <TextSpan>[
                TextSpan(
                    text: 'Tap here', style: TextStyle(color: Colors.blue)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          child: const Text('Activate'),
        ),
        const SizedBox(height: 50),
      ],
    );
  }

  Widget buildMobileNumberUI() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: const Row(
            children: [
              Expanded(
                child: Text(
                  "Enter your mobile number to activate your account.",
                  style: TextStyle(fontSize: 18),
                  softWrap: true,
                ),
              ),
              SizedBox(width: 10),
              Icon(Icons.info_outline, size: 23),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
            constraints: const BoxConstraints(maxHeight: 70),
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Image.asset(
                  "images/MYflag.png",
                  height: 30,
                  width: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text("+60"),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: TextField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Checkbox(
                value: _isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked = value!;
                  });
                },
              ),
              const Expanded(
                child: Text(
                  "I agree to the terms & conditions",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(bottom: 50),
          child: Center(
            child: ElevatedButton(
              onPressed: _isChecked && isPhoneNumberValid()
                  ? () {
                      setState(() {
                        _isOTPStage = true;
                      });
                    }
                  : null,
              child: const Text('Get Activation Code'),
            ),
          ),
        ),
      ],
    );
  }

  bool isPhoneNumberValid() {
    String num = _phoneController.text;
    return num.length >= 9 && num.length <= 10;
  }
}
