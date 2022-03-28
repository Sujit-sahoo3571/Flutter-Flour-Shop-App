import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class ChatWithUs extends StatefulWidget {
  const ChatWithUs({Key? key}) : super(key: key);

  @override
  State<ChatWithUs> createState() => _ChatWithUsState();
}

class _ChatWithUsState extends State<ChatWithUs> {
  List<Message> messages = [
    Message(
        text: "Hi!, May I help You ?",
        date: DateTime.now().subtract(Duration(days: 5, minutes: 1)),
        isSentbyMe: false),
    Message(
        text: "How I available for more offers?",
        date: DateTime.now().subtract(Duration(days: 5, minutes: 2)),
        isSentbyMe: true),
    Message(
        text: "Buy more products or Share Our App with Your friends",
        date: DateTime.now().subtract(Duration(days: 5, minutes: 3)),
        isSentbyMe: false),
    Message(
        text: "Why did not you start your free delivery services? ",
        date: DateTime.now().subtract(Duration(days: 4, minutes: 4)),
        isSentbyMe: true),
    Message(
        text: "We are working on it so it'll be available Soon\n"
            " also we want you to visit our store which is near you\n"
            " In order to check the quality of the products",
        date: DateTime.now().subtract(Duration(days: 4, minutes: 5)),
        isSentbyMe: false),
    Message(
        text: "I Pickedup the Wrong Product What should I do?",
        date: DateTime.now().subtract(Duration(days: 3, minutes: 1)),
        isSentbyMe: true),
    Message(
        text: "Please Visit to the store and show them the Details"
            " So Your product will be replaced As per our Terms and Conditions",
        date: DateTime.now().subtract(Duration(days: 3, minutes: 2)),
        isSentbyMe: false),
    Message(
        text:
            "What if my Transaction Failed, but money deducted from my account ?",
        date: DateTime.now().subtract(Duration(days: 2, minutes: 8)),
        isSentbyMe: true),
    Message(
        text:
            "You will get your money refunded with in 3 Business working days",
        date: DateTime.now().subtract(Duration(days: 2, minutes: 9)),
        isSentbyMe: false),
    Message(
        text:
            "For Recommendation or queries Send us Your suggestions in our About Page"
            " We Love To Hear From You, Thank You For Your Time !",
        date: DateTime.now().subtract(Duration(minutes: 10)),
        isSentbyMe: false),
  ].toList();

  TextEditingController messageText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat")),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: GroupedListView<Message, DateTime>(
              reverse: true,
              order: GroupedListOrder.DESC,
              useStickyGroupSeparators: true,
              floatingHeader: true,
              padding: EdgeInsets.all(12.0),
              elements: messages,
              groupBy: (message) => DateTime(
                message.date.year,
                message.date.month,
                message.date.day,
              ),
              groupHeaderBuilder: (Message message) => SizedBox(
                height: 50.0,
                child: Center(
                  child: Card(
                    color: Colors.blue,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(DateFormat.yMMMd().format(message.date),
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ),
              itemBuilder: (context, Message message) => Align(
                alignment: message.isSentbyMe
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Card(
                  elevation: 8.0,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Text(message.text)),
                  ),
                ),
              ),
            ),
          )),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10.0),
                color: Colors.grey.shade300,
                child: TextField(
                  controller: messageText,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    hintText: 'Type Your Message Here ',
                  ),
                ),
              ),
              Positioned(
                right: 10.0,
                child: IconButton(
                  onPressed: () {
                    if (messageText.text.trim().isNotEmpty) {
                      final message = Message(
                          text: messageText.text,
                          date: DateTime.now(),
                          isSentbyMe: true);
                      setState(() {
                        messages.add(message);
                        final senderText = _sendNewText(messageText.text);
                        messages.add(senderText);
                      });
                      messageText.text = "";
                    }
                  },
                  icon: Icon(Icons.send),
                  color: Colors.blue,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Message _sendNewText(String text) {
    String newText = "Can't Understand Please Select 1/2/3";
    switch (text.toLowerCase()) {
      case "hi":
        newText = "Welcome Sir/Madam,\n May I Help You? "
            "\nSelect 1: If Money Related Issue  "
            "\nSelect 2: If Product Related Issue  "
            "\nSelect 3: If Delivery/Services Related Issue  ";
        break;
      case "1":
        newText = "Please Give Us Some Time We Check In our Transaction"
            " Status, \n\n...Thank You For Your Patience\n Yes,as we see "
            "Your money will be refunded with in 3 Working Days ";
        break;
      case "2":
        newText = "Please send the Whole details to our feedback Page on "
            "About Page we will assure you to solve this issue as soon as possible"
            "Thank You For Notifying Us";
        break;
      case "3":
        newText = "Contact Our Cheif Executive Manager \n"
            "simension@newmail.com or call 1800-166-6546 ";
        break;
      default:
    }
    return Message(text: newText, date: DateTime.now(), isSentbyMe: false);
  }
}

class Message {
  String text;
  DateTime date;
  bool isSentbyMe;
  Message({required this.text, required this.date, required this.isSentbyMe});
}
