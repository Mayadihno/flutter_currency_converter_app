import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState
    extends State<CurrencyConverterCupertinoPage> {
  double result = 0;
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          "Currency Converter",
          style: TextStyle(color: CupertinoColors.white, fontSize: 18),
        ),
        backgroundColor: CupertinoColors.systemBlue,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Text(
                NumberFormat.currency(locale: 'en_US', symbol: '₦')
                    .format(result),
                style: const TextStyle(
                    fontSize: 25,
                    backgroundColor: CupertinoColors.black,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 34, 86, 190)),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: CupertinoTextField(
                controller: textEditingController,
                style:
                    const TextStyle(color: CupertinoColors.black, fontSize: 18),
                decoration: const BoxDecoration(
                  color: CupertinoColors.white,
                  border: Border(),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                placeholder: "Please enter the amount in USD",
                prefix: const Icon(CupertinoIcons.money_dollar),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CupertinoButton(
                onPressed: () {
                  setState(() {
                    result = double.parse(textEditingController.text) * 1500;
                  });
                },
                color: CupertinoColors.systemBlue,
                borderRadius: BorderRadius.circular(5),
                child: const Text(
                  "Convert",
                  style: TextStyle(fontSize: 20, color: CupertinoColors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
