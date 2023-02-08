import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key, this.value});

  final value;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // BotToast.showText(text: "дээр дарлаа");
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            const Icon(
              Icons.laptop_mac,
              color: Color(0xFF3F44C8),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value['title'],
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    value['description'],
                    style: const TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Color(0xFF3F44C8),
            )
          ],
        ),
      ),
    );
  }
}
