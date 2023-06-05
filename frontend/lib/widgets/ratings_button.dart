import 'package:flutter/material.dart';

class RatingsButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  const RatingsButton({
    super.key,
    required this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(
                0.0,
                4.0,
              ),
              blurRadius: 4.0,
              spreadRadius: 0.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
        ),
        child: Chip(
          label: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.star_rate),
              const SizedBox(
                width: 5,
              ),
              Text(
                label,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          labelPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        ),
      ),
    );
  }
}
