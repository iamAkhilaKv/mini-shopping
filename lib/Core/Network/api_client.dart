import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monoshopping/Core/Network/api_class.dart';

final apiClient=Provider<ApiClass>((ref)=>ApiClass());