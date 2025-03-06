import 'dart:convert';

import 'package:amazon_clone/constants/utils.dart';
import 'package:http/http.dart' as http;
import "package:flutter/material.dart";

void httpErrorHandler(
    {required http.Response response,
    required BuildContext context,
    required VoidCallback onSuccess}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      snackbar(context, jsonDecode(response.body)["msg"]);
      break;
    case 500:
      snackbar(context, jsonDecode(response.body)["error"]);
      break;
    default:
    snackbar(context, "An error occurred");
  }
}
