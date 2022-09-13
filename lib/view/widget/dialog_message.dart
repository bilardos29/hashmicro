import 'package:flutter/material.dart';

class DialogMessage extends StatelessWidget {
  final String message;
  final VoidCallback? onDone;

  const DialogMessage({Key? key, required this.message, this.onDone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 50),
          padding: const EdgeInsets.all(24),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Material(
              type: MaterialType.transparency,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "$message",
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.black87),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              InkWell(
                                  onTap: onDone,
                                  child: Container(
                                    height: 32,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      "Close",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                  ))
                            ]))
                  ]))),
    );
  }
}
