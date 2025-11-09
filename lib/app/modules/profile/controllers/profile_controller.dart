import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxBool notificationsEnabled = true.obs;

  RxBool isCurrentPasswordVisible = true.obs;
  RxBool isNewPasswordVisible = true.obs;
  RxBool isConfirmPasswordVisible = true.obs;

  final List<Map<String, dynamic>> subscriptionPlans = [
    {
      "title": "Silver",
      "tagline": "Best For New Owners",
      "price": "\$0.00/mth",
      "annualPrice": 'Download App',
      "badge": "🎉 Forever Free 🎉",
      "buttonText": "Join Free",
      "ctaLabel": "Get Clarity",
      "features": [
        "Instant Snapshot after linking HGV/Hilton/RCI/Interval: what you own + next 3 deadlines.",
        "Ask the Genie: 10 questions/month.",
        "1 Smart Alert for 1 resort: choose booking window or points expiring.",
        "Vault Lite (200 MB) for documents.",
        "Basics Library: simple guides and red-flag tips.",
        "“Why?” on every alert: the rule, the risk, the action."
      ]
    },
    {
      "title": "Gold Elite",
      "tagline": "For Owners Who Act Fast",
      "price": "\$14.99/mth",
      "annualPrice": "\$149/Annually",
      "badge": "🎉 14 Day Free Trial 🎉",
      "buttonText": "Start Free 7-Day Trial",
      "ctaLabel": "Get Control",
      "features": [
        "Ask the Genie: 100 questions/month (ask from any screen).",
        "Smart Alerts for up to 3 resorts/programs: booking opens, upgrades, cancellations, points expiring, maintenance fees due.",
        "Smart Document Summaries + Highlights: bank-by dates, blackout rules, cancellation windows, fees.",
        "Best-Move Tool with clear math: Use, Bank, Exchange (RCI/II), or Convert to Hilton Honors.",
        "Value Guard: cost-per-night and bad-value warnings with better options.",
        "Maintenance Fee Tracker: year-over-year trend, peer benchmark, mischarge flag.",
        "Year-End Plan (60-day countdown): expirations/fees/credits with auto-calendar entries.",
        "Savings Counter (in app + monthly email): expiries prevented, late fees avoided, value improvements in \$."
      ]
    },
    {
      "title": "Platinum Premier",
      "tagline": "Smart Management for Busy Owners",
      "price": "\$29.99/mth",
      "annualPrice": "\$299/Annually",
      "badge": "🎉 Surprise Deals 🎉",
      "buttonText": "Go Platinum",
      "ctaLabel": "Go Autopilot",
      "features": [
        "Unlimited Genie + Deep Research (long docs, side-by-side comparisons).",
        "Portfolio-wide Smart Alerts + Action Cards for all linked resorts/programs.",
        "Light Automations with guardrails: exchange match watch + pre-approved holds; auto-add all key dates to your calendar.",
        "Ownership Value Dashboard: points, deadlines, wins, and total dollars saved YTD.",
        "Annual Auto-Plan: when to book, bank, exchange, or convert—approve and apply.",
        "Honors Conversion Coach: instant save/lose verdicts using your ratios and MF costs.",
        "Exchange Value Scenarios (RCI/II): trade-power guidance and deposit-timing suggestions.",
        "Elite Progress Signals: track progress to next HGV tier and discover ways to get there.",
        "Year-End Close (90/60/30/14-day): reconciles points, fees, Open Season/resort credits; “Approve All” with undo where allowed.",
        "Leftover Sweeper: short-notice uses or sale storage for odd balances.",
        "Activity Log + Undo + Trust Score: see every action, receipt, and data confidence."
      ]
    }
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
