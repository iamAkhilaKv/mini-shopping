import 'package:flutter/material.dart';

class NoInternetWidget {
  Widget noInternet(){

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.wifi_off, size: 80, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            "No internet connection",
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}