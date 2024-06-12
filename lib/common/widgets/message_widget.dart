import 'package:flutter/material.dart';

/// A widget that displays a message with a leading icon.
///
/// An [icon] and [message] must be provided.
class MessageWidget extends StatelessWidget {
  final IconData icon;
  final String message;
  const MessageWidget({super.key, required this.icon, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 320,
      decoration: BoxDecoration(
        color: const Color(0xFFEEEEEE),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              message,
              style: const TextStyle(fontSize: 16),
              softWrap: true,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
