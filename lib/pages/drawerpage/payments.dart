import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flour_shop/pages/cart/cartcontroller.dart';
import 'package:flutter_flour_shop/pages/cart/ecart.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Payments extends StatefulWidget {
  const Payments({Key? key, required this.isCart}) : super(key: key);
  final bool isCart;

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  late Razorpay _razorpay;
  TextEditingController paytext = TextEditingController();
  CartController _cartController = Get.find();

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void openCheckOut() {
    var options = {
      'key': 'rzp_test_zk52V3tO1yr4wy',
      'amount': widget.isCart
          ? _cartController.payamount()
          : _cartController.epayamount(), // paytext.text
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'prefill': {'contact': '8984902489', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['PhonePe','paytm', ]
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error : $e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);

    widget.isCart ? _cartController.empty() : _cartController.itemsEmpty();
    Ecart().showalertDialog(context);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payment")),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                openCheckOut();
              },
              child: const Text("Pay Now"))),
    );
  }
}
