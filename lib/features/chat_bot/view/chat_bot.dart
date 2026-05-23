// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:octafitpro/core/global/color/app_colors_dark.dart';
// import 'package:octafitpro/shared/custom_text.dart';
// import 'package:octafitpro/shared/custom_txtfield.dart';
// import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

// class ChatBot extends StatefulWidget {
//   ChatBot({super.key});

//   @override
//   State<ChatBot> createState() => _ChatBotState();
// }

// class _ChatBotState extends State<ChatBot> {
//   TextEditingController chatController = TextEditingController();
//   List messages = [];

//   void userMessage(String message) {
//     setState(() {
//       messages.insert(0, {'sender': 'user', 'massege': message});
//     });
//     print(message);
//     chatController.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var sizeWi = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColorsDark.primaryColor,
//         title: CustomText(
//           text: "Chat Bot",
//           color: Colors.white,
//           fontWeight: FontWeight.bold,
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Container(
//               color: AppColorsDark.primaryColor,
//               child: ListView.builder(
//                 reverse: true,
//                 itemCount: messages.length,
//                 itemBuilder: (context, index) {
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(5),
//                         child: Container(
//                           padding: EdgeInsets.all(15),
//                           child: Text(
//                             messages[index]['massege'],
//                             style: TextStyle(fontSize: 16, color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ),
//           Container(
//             height: 60,
//             width: double.infinity,
//             color: Colors.white,
//             child: Row(
//               children: [
//                 IconButton(
//                   onPressed: () {},
//                   icon: Icon(Icons.perm_media_outlined),
//                 ),
//                 Gap(5),
//                 SizedBox(
//                   width: sizeWi / 1.3,
//                   child: TextField(
//                     controller: chatController,
//                     style: TextStyle(fontSize: 20),
//                     decoration: InputDecoration.collapsed(hintText: "send "),
//                   ),
//                 ),
//                 Gap(5),
//                 IconButton(
//                   onPressed: () {
//                     userMessage(chatController.text);
//                   },
//                   icon: Icon(Icons.send),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  // ===== 1. تعريف المتغيرات =====

  // مفتاح API - ضع مفتاحك الحقيقي هنا
  static const String _apiKey = 'AIzaSyCuq3Y_8fEnb5yQigLW3Fao_-6jRmt8WX4';

  // نموذج Gemini
  late final GenerativeModel _model;

  // جلسة المحادثة (تتولى حفظ التاريخ تلقائياً)
  late final ChatSession _chatSession;

  // قائمة الرسائل المعروضة في الواجهة
  final List<ChatMessage> _messages = [];

  // متحكم النص المدخل
  final TextEditingController _textController = TextEditingController();

  // حالة التحميل (هل يكتب البوت رداً؟)
  bool _isLoading = false;

  // ScrollController للتمرير التلقائي
  final ScrollController _scrollController = ScrollController();

  // ===== 2. دالة تهيئة النموذج وجلسة المحادثة =====
  bool _canSend = true;

  @override
  void initState() {
    super.initState();
    _initializeGemini();
  }

  void _initializeGemini() {
    // إنشاء النموذج مع تعليمات النظام (System Instructions)
    _model = GenerativeModel(
      model: 'gemini-2.0-flash', // نموذج سريع ومجاني
      apiKey: _apiKey,
      systemInstruction: Content.text(
        'أنت مساعد ذكي لمتجر منتجات رياضية. '
        'ساعد العملاء في اختيار المنتجات المناسبة مثل الأحذية، الملابس، والمعدات الرياضية. '
        'قدم نصائح مفيدة بناءً على احتياجاتهم. تحدث باللغة العربية.',
      ),
    );

    // بدء جلسة محادثة جديدة
    _chatSession = _model.startChat();
  }

  // ===== 3. دالة إرسال الرسالة ومعالجة الرد =====

  Future<void> _sendMessage() async {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    if (!_canSend || _isLoading) return;

    _canSend = false;

    // إضافة رسالة المستخدم إلى الواجهة
    setState(() {
      _messages.add(ChatMessage(text: text, isUser: true));
      _textController.clear();
      _isLoading = true;
    });

    _scrollToBottom();

    try {
      // إرسال الرسالة إلى Gemini والحصول على الرد
      final response = await _chatSession.sendMessage(Content.text(text));
      final responseText = response.text ?? 'عذراً، لم أستطع معالجة طلبك.';

      // إضافة رد البوت إلى الواجهة
      setState(() {
        _messages.add(ChatMessage(text: responseText, isUser: false));
        _isLoading = false;
      });

      _scrollToBottom();
    } catch (e) {
      // معالجة الأخطاء
      setState(() {
        _messages.add(
          ChatMessage(text: 'حدث خطأ: ${e.toString()}', isUser: false),
        );
        _isLoading = false;
      });
    }
  }

  // ===== 4. دالة التمرير التلقائي =====

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  // ===== 5. دالة مسح المحادثة =====

  void _clearChat() {
    setState(() {
      _messages.clear();
      // بدء جلسة جديدة
      _chatSession = _model.startChat();
    });
  }

  // ===== 6. بناء واجهة المستخدم =====

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المساعد الرياضي'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: _clearChat,
            tooltip: 'مسح المحادثة',
          ),
        ],
      ),
      body: Column(
        children: [
          // منطقة عرض الرسائل
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _buildMessageBubble(message);
              },
            ),
          ),

          // مؤشر الكتابة
          if (_isLoading) _buildTypingIndicator(),

          // حقل الإدخال
          _buildInputField(),
        ],
      ),
    );
  }

  // ===== 7. مكون فقاعة الرسالة =====

  Widget _buildMessageBubble(ChatMessage message) {
    final isUser = message.isUser;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isUser ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: isUser ? const Radius.circular(16) : Radius.zero,
            bottomRight: isUser ? Radius.zero : const Radius.circular(16),
          ),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black87,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  // ===== 8. مكون مؤشر الكتابة =====

  Widget _buildTypingIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(width: 8),
                Text('يكتب...'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ===== 9. مكون حقل الإدخال =====

  Widget _buildInputField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -2),
            blurRadius: 8,
            color: Colors.black.withOpacity(0.05),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'اكتب سؤالك عن المنتجات الرياضية...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white, size: 20),
              onPressed: _sendMessage,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}

// ===== 10. نموذج البيانات للرسالة =====

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}
