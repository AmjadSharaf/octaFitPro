// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:projecttt/core/const/app_color.dart';
// import 'package:projecttt/core/localization/app_language.dart';
// import 'package:projecttt/core/network/api_config.dart';

// class OnlineOnlyGate extends StatefulWidget {
//   const OnlineOnlyGate({super.key, required this.child});

//   final Widget child;

//   @override
//   State<OnlineOnlyGate> createState() => _OnlineOnlyGateState();
// }

// enum _OnlineStatus { checking, online, offline }

// class _OnlineOnlyGateState extends State<OnlineOnlyGate>
//     with WidgetsBindingObserver {
//   static const Duration _timeout = Duration(seconds: 6);
//   static const Duration _checkInterval = Duration(seconds: 15);

//   _OnlineStatus _status = _OnlineStatus.checking;
//   Timer? _timer;
//   bool _isChecking = false;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//     _checkConnection();
//     _timer = Timer.periodic(
//       _checkInterval,
//       (_) => _checkConnection(silent: true),
//     );
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.resumed) {
//       _checkConnection(silent: true);
//     }
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     _timer?.cancel();
//     super.dispose();
//   }

//   Future<void> _checkConnection({bool silent = false}) async {
//     if (_isChecking) {
//       return;
//     }

//     _isChecking = true;

//     if (!silent && mounted) {
//       setState(() => _status = _OnlineStatus.checking);
//     }

//     final isOnline = await _canReachApi();

//     _isChecking = false;

//     if (!mounted) {
//       return;
//     }

//     setState(() {
//       _status = isOnline ? _OnlineStatus.online : _OnlineStatus.offline;
//     });
//   }

//   Future<bool> _canReachApi() async {
//     try {
//       final response = await http
//           .get(
//             ApiConfig.uri('/me'),
//             headers: const {'Accept': 'application/json'},
//           )
//           .timeout(_timeout);

//       return response.statusCode == 200 || response.statusCode == 401;
//     } catch (_) {
//       return false;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_status == _OnlineStatus.online) {
//       return widget.child;
//     }

//     return _ConnectionStatusScreen(
//       isChecking: _status == _OnlineStatus.checking,
//       onRetry: _checkConnection,
//     );
//   }
// }

// class _ConnectionStatusScreen extends StatelessWidget {
//   const _ConnectionStatusScreen({
//     required this.isChecking,
//     required this.onRetry,
//   });

//   final bool isChecking;
//   final VoidCallback onRetry;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.backgroundTop,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.all(24),
//             child: ConstrainedBox(
//               constraints: const BoxConstraints(maxWidth: 420),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Container(
//                     width: 88,
//                     height: 88,
//                     decoration: BoxDecoration(
//                       color: AppColor.rose.withValues(alpha: 0.12),
//                       shape: BoxShape.circle,
//                     ),
//                     child: Icon(
//                       isChecking
//                           ? Icons.wifi_find_outlined
//                           : Icons.wifi_off_rounded,
//                       color: AppColor.rose,
//                       size: 42,
//                     ),
//                   ),
//                   const SizedBox(height: 22),
//                   Text(
//                     isChecking
//                         ? context.text(
//                             ar: 'جاري فحص الاتصال',
//                             en: 'Checking connection',
//                           )
//                         : context.text(
//                             ar: 'لا يوجد اتصال بالإنترنت',
//                             en: 'No internet connection',
//                           ),
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                       color: AppColor.textDark,
//                       fontSize: 24,
//                       fontWeight: FontWeight.w900,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     context.text(
//                       ar: 'يحتاج التطبيق اتصالاً بالإنترنت حتى يتم تسجيل الدخول وحفظ بياناتك بشكل آمن.',
//                       en: 'This app needs an internet connection to sign in and save your data securely.',
//                     ),
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                       color: AppColor.textMuted,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w700,
//                       height: 1.45,
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton.icon(
//                       onPressed: isChecking ? null : onRetry,
//                       icon: isChecking
//                           ? const SizedBox(
//                               width: 16,
//                               height: 16,
//                               child: CircularProgressIndicator(
//                                 strokeWidth: 2,
//                                 valueColor: AlwaysStoppedAnimation<Color>(
//                                   AppColor.white,
//                                 ),
//                               ),
//                             )
//                           : const Icon(Icons.refresh_rounded),
//                       label: Text(
//                         isChecking
//                             ? context.text(
//                                 ar: 'يرجى الانتظار',
//                                 en: 'Please wait',
//                               )
//                             : context.text(ar: 'إعادة المحاولة', en: 'Retry'),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColor.rose,
//                         foregroundColor: AppColor.white,
//                         disabledBackgroundColor: AppColor.rose.withValues(
//                           alpha: 0.55,
//                         ),
//                         disabledForegroundColor: AppColor.white,
//                         padding: const EdgeInsets.symmetric(vertical: 14),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         textStyle: const TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.w900,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
