import 'dart:isolate';
import 'dart:ui';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationService {
  const NotificationService._();

  static const String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  static final ReceivePort _port = ReceivePort();
  static final FlutterLocalNotificationsPlugin _flutterLocalNotification =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final initializationSettingsDarwin = DarwinInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) {},
    );
    const initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
      linux: initializationSettingsLinux,
    );

    await _flutterLocalNotification.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {},
    );
  }

  static void initializeIsolate() {
    IsolateNameServer.registerPortWithName(
      _port.sendPort,
      _isolateName,
    );
  }

  static Future<void> showNotification({
    required String body,
    required String payload,
  }) async {
    const androidNotificationDetails = AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotification.show(
      0,
      'Work on your target!',
      body,
      notificationDetails,
      payload: payload,
    );
  }

  @pragma('vm:entry-point')
  static Future<void> callback() async {
    final sp = await SharedPreferences.getInstance();
    await sp.reload();
    final target = sp.getString('target_name');
    await NotificationService.showNotification(
      body: "🎯 Don't forget! $target is waiting "
          'to be finished by tomorrow!',
      payload: '',
    );
    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
