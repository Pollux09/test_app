import 'package:flutter/material.dart';
import 'package:testapp/storage/storage.dart';

class PaywallScreen extends StatefulWidget {
  final Storage storage;

  const PaywallScreen({required this.storage, super.key});

  @override
  State<StatefulWidget> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> {
  String selectedPlan = "month";

  Future<void> buySub() async {
    await widget.storage.setSub();
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Оплата подписки',
                style: TextStyle(
                  color: const Color.fromARGB(255, 52, 52, 52),
                  fontSize: 32.0,
                  fontWeight: FontWeight.w900,
                ),
              ),

              const SizedBox(height: 32),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildPlanToggle(
                    label: "Месяц",
                    price: "\$11",
                    selected: selectedPlan == "month",
                    onTap: () {
                      setState(() => selectedPlan = "month");
                    },
                  ),
                  const SizedBox(width: 16),
                  _buildPlanToggle(
                    label: "Год",
                    price: "\$89",
                    discount: "-33%",
                    selected: selectedPlan == "year",
                    onTap: () {
                      setState(() => selectedPlan = "year");
                    },
                  ),
                ],
              ),

              const SizedBox(height: 32),

              ElevatedButton(
                onPressed: buySub,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 52,
                    vertical: 18,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 8,
                  shadowColor: Colors.blueAccent.withOpacity(0.4),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.monetization_on_outlined, size: 26),
                    const SizedBox(width: 12),
                    Text('Продолжить'),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              Text(
                selectedPlan == "month"
                    ? "С вас будет списано \$11 за месяц"
                    : "С вас будет списано \$89 за год",
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlanToggle({
    required String label,
    required String price,
    String? discount,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
        decoration: BoxDecoration(
          color: selected ? Colors.blueAccent : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? Colors.blueAccent : Colors.grey.shade300,
            width: 2,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.3),
                    blurRadius: 14,
                    offset: const Offset(0, 6),
                  )
                ]
              : [],
        ),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: selected ? Colors.white : Colors.black,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              price,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: selected ? Colors.white : Colors.black,
              ),
            ),

            if (discount != null) ...[
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                decoration: BoxDecoration(
                  color: selected
                      ? Colors.white
                      : const Color.fromARGB(255, 255, 113, 103),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  discount,
                  style: TextStyle(
                    color: selected
                        ? Colors.blueAccent
                        : const Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
