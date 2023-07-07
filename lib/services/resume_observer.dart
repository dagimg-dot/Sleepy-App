import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dnd/flutter_dnd.dart';

class ResumeObserver extends WidgetsBindingObserver {
  final Completer<void> completer;
  final BuildContext context;
  bool shouldRemoveObserver = false;

  ResumeObserver(this.completer, this.context);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Check permission status after app resumes
      checkPermissionStatus();
    }
    
    if (shouldRemoveObserver) {
      WidgetsBinding.instance.removeObserver(this);
    }
  }

  Future<void> checkPermissionStatus() async {
    bool? isGranted = await FlutterDnd.isNotificationPolicyAccessGranted;
    if (isGranted == true) {
      completer.complete();
    } else {
      completer.complete();
    } 
    
    // Set the flag to indicate whether the observer should be removed
    shouldRemoveObserver = true;
  }
}
