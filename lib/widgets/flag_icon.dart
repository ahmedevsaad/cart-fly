import 'package:flutter/material.dart';

class FlagIcon extends StatelessWidget {
  const FlagIcon({super.key, required this.code, this.size = 96});
  final String code;
  final double size;

  static const Map<String, String> _emoji = {
    'sa': '🇸🇦',
    'eg': '🇪🇬',
    'ae': '🇦🇪',
    'us': '🇺🇸',
    'cn': '🇨🇳',
  };

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Image.asset(
        'assets/flags/$code.png',
        width: size,
        height: size * 0.7,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          width: size,
          height: size * 0.7,
          color: const Color(0xFFE8ECFF),
          alignment: Alignment.center,
          child: Text(
            _emoji[code] ?? '🏳️',
            style: TextStyle(fontSize: size * 0.55),
          ),
        ),
      ),
    );
  }
}
