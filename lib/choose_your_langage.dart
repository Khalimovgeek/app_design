import 'package:flutter/material.dart';

class ChooseYourLanguage extends StatefulWidget {
  const ChooseYourLanguage({super.key});

  @override
  State<ChooseYourLanguage> createState() => _ChooseYourLanguageState();
}

class _ChooseYourLanguageState extends State<ChooseYourLanguage> {
  String? selectedLang; // To store selected language
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Choose Your Language",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 16),
            Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.1),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    buildRadio("English", "Hi"),
                    buildRadio("Hindi", "नमस्ते"),
                    buildRadio("Bengali", "হ্যালো"),
                    buildRadio("Kannada", "ನಮಸ್ಕಾರ"),
                    buildRadio("Punjabi", "ਸਤ ਸ੍ਰੀ ਅਕਾਲ"),
                    buildRadio("Tamil", "வணக்கம்"),
                    buildRadio("Telugu", "హలో"),
                    buildRadio("French", "Bonjour"),
                    buildRadio("Spanish", "Hola"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                if (selectedLang != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Selected: $selectedLang")),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Please select a language first.")),
                  );
                }
              },
              child: const Text(
                "Select",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // helper widget
  Widget buildRadio(String lang, String greeting) {
    return RadioListTile(
      activeColor: Colors.black,
      value: lang,
      groupValue: selectedLang,
      onChanged: (value) {
        setState(() => selectedLang = value.toString());
      },
      title: Text(lang, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(greeting),
      controlAffinity: ListTileControlAffinity.trailing,
    );
  }
}
