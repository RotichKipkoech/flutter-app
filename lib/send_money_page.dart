// send_money_page.dart
import 'package:flutter/material.dart';
import 'custom_button.dart'; // Import custom button widget

class SendMoneyPage extends StatefulWidget {
  @override
  _SendMoneyPageState createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController recipientController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  String paymentMethod = 'Credit Card';
  bool isFavorite = false;
  bool success = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Send Money')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Recipient Name TextField
              TextFormField(
                controller: recipientController,
                decoration: InputDecoration(labelText: 'Recipient Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter recipient name';
                  }
                  return null;
                },
              ),
              // Amount TextField
              TextFormField(
                controller: amountController,
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an amount';
                  } else if (double.tryParse(value) == null || double.parse(value) <= 0) {
                    return 'Please enter a valid positive amount';
                  }
                  return null;
                },
              ),
              // Payment Method Dropdown
              DropdownButton<String>(
                value: paymentMethod,
                onChanged: (String? newValue) {
                  setState(() {
                    paymentMethod = newValue!;
                  });
                },
                items: <String>['Credit Card', 'Paypal', 'Bank Transfer']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              // Switch for Marking as Favorite
              SwitchListTile(
                title: Text('Mark as Favorite'),
                value: isFavorite,
                onChanged: (bool newValue) {
                  setState(() {
                    isFavorite = newValue;
                  });
                },
              ),
              // Custom Button to Send Money
              CustomButton(
                text: 'Send Money',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      success = true; // Simulate success
                    });
                  }
                },
              ),
              // Animated Success or Failure Message
              AnimatedContainer(
                duration: Duration(seconds: 1),
                decoration: BoxDecoration(
                  color: success ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    success ? 'Transaction Successful!' : 'Transaction Failed!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}