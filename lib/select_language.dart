import 'package:flutter/material.dart';

class SelectLanguage extends StatefulWidget {
  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  final List<String> _languages = [
    'English',
    'Assamese', 'Bengali', 'Bodo', 'Dogri', 'Gujarati', 'Hindi', 'Kannada',
    'Kashmiri', 'Konkani', 'Maithili', 'Malayalam', 'Manipuri', 'Marathi',
    'Nepali', 'Odia', 'Punjabi', 'Sanskrit', 'Santali', 'Sindhi', 'Tamil',
    'Telugu', 'Urdu'
  ];
  String? _selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                'Select Language',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                value: _selectedLanguage,
                hint: Text('Select your preferred language'),
                onChanged: (newValue) {
                  setState(() {
                    _selectedLanguage = newValue;
                  });
                },
                items: _languages.map((language) {
                  return DropdownMenuItem<String>(
                    value: language,
                    child: Text(language),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_selectedLanguage != null) {
                    Navigator.pushNamed(
                      context,
                      '/login',
                      arguments: _selectedLanguage,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select a language')),
                    );
                  }
                },
                child: Text('Submit'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/login',
                    arguments: 'English',
                  );
                },
                child: Text('Skip'),
              ),
              SizedBox(height: 20),
              Text(
                'Select your preferred language from the drop-down menu or skip to proceed in English',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
