import 'dart:convert';
import 'package:http/http.dart' as http;
import "package:flutter/material.dart";

import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/models/user_model.dart';
import 'package:amazon_clone/constants/global_variables.dart';

class AuthServices {
  //signup
  void signUpUser(
      {required String name,
      required String email,
      required String password,
      required BuildContext context}) async {
    try {
      UserModel user = UserModel(
          id: "",
          name: name,
          email: email,
          password: password,
          address: "",
          type: "",
          token: "");

      http.Response res = await http
          .post(Uri.parse("$uri/auth/register"), body: user.toJson(), headers: {
        'Content-Type': 'application/json',
        "charset": "utf-8",
      });

      if (!context.mounted) {
        return;
      }

      httpErrorHandler(
          response: res,
          context: context,
          onSuccess: () {
            snackbar(context, jsonDecode(res.body)["message"]);
          });
    } catch (e) {
      snackbar(context, e.toString());
    }
  }
}
