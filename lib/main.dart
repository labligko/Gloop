import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() {
  runApp(const GloopApp());
}

/// ===============================================================
/// APP ROOT
/// ===============================================================
class GloopApp extends StatefulWidget {
  const GloopApp({super.key});

  @override
  State<GloopApp> createState() => _GloopAppState();
}

class _GloopAppState extends State<GloopApp> {
  final AppController controller = AppController.mock();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScope(
      controller: controller,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GLOOP',
        theme: AppTheme.theme,
        home: const MainShell(),
      ),
    );
  }
}

/// ===============================================================
/// THEME / COLORS
/// ===============================================================
class AppColors {
  static const primary = Color(0xFF00B060); // hijau utama (mendekati UI kamu)
  static const bg = Colors.white;
  static const text = Color(0xFF111827);
  static const muted = Color(0xFF6B7280);
  static const border = Color(0xFFE5E7EB);
  static const card = Colors.white;
  static const softGreen = Color(0xFFEAFBF2);
  static const danger = Color(0xFFEF4444);
}

class AppTheme {
  static ThemeData get theme {
    final base = ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: AppColors.bg,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary).copyWith(
        primary: AppColors.primary,
        secondary: AppColors.primary,
        surface: Colors.white,
      ),
    );

    return base.copyWith(
      textTheme: base.textTheme.apply(
        bodyColor: AppColors.text,
        displayColor: AppColors.text,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: 1,
        space: 1,
      ),
    );
  }
}

/// ===============================================================
/// SIMPLE I18N (ID / EN) — ringan, tanpa package
/// ===============================================================
enum AppLang { id, en }

class AppStrings {
  static const Map<AppLang, Map<String, String>> _s = {
    AppLang.id: {
      'appTitle': 'Ekosistem Sampah Pintar',
      'home': 'Beranda',
      'rewards': 'Hadiah',
      'history': 'Riwayat',
      'profile': 'Profil',
      'yourPoints': 'Poin GLOOP Anda',
      'schedulePickup': 'Jadwalkan Penjemputan',
      'nextPickup': 'Penjemputan Berikutnya',
      'totalPickups': 'Total Penjemputan',
      'yourImpact': 'Dampak Lingkungan Anda',
      'co2Saved': 'CO₂ Tersimpan',
      'recentActivity': 'Aktivitas Terkini',
      'pointsAvailable': 'Poin Tersedia',
      'redeem': 'Tukar',
      'insufficientPoints': 'Poin tidak cukup',
      'redeemed': 'Berhasil ditukar',
      'activityHistory': 'Riwayat Aktivitas',
      'pickupsTab': 'Penjemputan',
      'rewardsTab': 'Hadiah',
      'totalWaste': 'Total Sampah Terkumpul',
      'pointsEarned': 'Poin Diperoleh',
      'totalWeight': 'Total Berat',
      'materialsSortedAi': 'Bahan Dipilah AI:',
      'impactYou': 'Dampak Anda',
      'claimedRewards': 'Hadiah Diklaim',
      'language': 'Language / Bahasa',
      'pickupAddress': 'Alamat Penjemputan',
      'addNewAddress': '+ Tambah Alamat Baru',
      'notifications': 'Notifikasi',
      'pickupReminder': 'Pengingat Penjemputan',
      'pickupReminderDesc': 'Dapatkan notifikasi sebelum jadwal penjemputan',
      'rewardUpdates': 'Pembaruan Hadiah',
      'rewardUpdatesDesc': 'Hadiah baru dan penawaran khusus',
      'impactReport': 'Laporan Dampak',
      'impactReportDesc': 'Ringkasan dampak lingkungan bulanan',
      'settings': 'Pengaturan',
      'accountSettings': 'Pengaturan Akun',
      'privacySecurity': 'Privasi & Keamanan',
      'helpSupport': 'Bantuan & Dukungan',
      'logout': 'Keluar',
      'all': 'Semua',
      'util': 'Utilitas',
      'shop': 'Belanja',
      'food': 'Kuliner',
      'fun': 'Hiburan',
      'thisMonth': 'bulan ini',
    },
    AppLang.en: {
      'appTitle': 'Smart Waste Ecosystem',
      'home': 'Home',
      'rewards': 'Rewards',
      'history': 'History',
      'profile': 'Profile',
      'yourPoints': 'Your GLOOP Points',
      'schedulePickup': 'Schedule Pickup',
      'nextPickup': 'Next Pickup',
      'totalPickups': 'Total Pickups',
      'yourImpact': 'Your Environmental Impact',
      'co2Saved': 'CO₂ Saved',
      'recentActivity': 'Recent Activity',
      'pointsAvailable': 'Points Available',
      'redeem': 'Redeem',
      'insufficientPoints': 'Not enough points',
      'redeemed': 'Redeemed',
      'activityHistory': 'Activity History',
      'pickupsTab': 'Pickups',
      'rewardsTab': 'Rewards',
      'totalWaste': 'Total Waste Collected',
      'pointsEarned': 'Points Earned',
      'totalWeight': 'Total Weight',
      'materialsSortedAi': 'Materials Sorted by AI:',
      'impactYou': 'Your Impact',
      'claimedRewards': 'Rewards Claimed',
      'language': 'Language',
      'pickupAddress': 'Pickup Address',
      'addNewAddress': '+ Add New Address',
      'notifications': 'Notifications',
      'pickupReminder': 'Pickup Reminder',
      'pickupReminderDesc': 'Get notified before pickup time',
      'rewardUpdates': 'Reward Updates',
      'rewardUpdatesDesc': 'New rewards and special offers',
      'impactReport': 'Impact Report',
      'impactReportDesc': 'Monthly environmental summary',
      'settings': 'Settings',
      'accountSettings': 'Account Settings',
      'privacySecurity': 'Privacy & Security',
      'helpSupport': 'Help & Support',
      'logout': 'Log out',
      'all': 'All',
      'util': 'Utilities',
      'shop': 'Shopping',
      'food': 'Food',
      'fun': 'Entertainment',
      'thisMonth': 'this month',
    },
  };

  static String of(AppLang lang, String key) {
    return _s[lang]?[key] ?? _s[AppLang.id]![key] ?? key;
  }
}

/// ===============================================================
/// MODELS
/// ===============================================================
class UserProfile {
  UserProfile({
    required this.name,
    required this.email,
    required this.location,
  });

  final String name;
  final String email;
  final String location;
}

class Address {
  Address({
    required this.label,
    required this.line1,
    required this.line2,
  });

  final String label;
  final String line1;
  final String line2;
}

class NotificationSettings {
  NotificationSettings({
    required this.pickupReminder,
    required this.rewardUpdates,
    required this.impactReport,
  });

  bool pickupReminder;
  bool rewardUpdates;
  bool impactReport;
}

enum RewardCategory { utilitas, belanja, kuliner, hiburan }

class RewardItem {
  RewardItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.costPoints,
    required this.category,
    required this.badgeIcon,
  });

  final String id;
  final String title;
  final String subtitle;
  final int costPoints;
  final RewardCategory category;
  final IconData badgeIcon;
}

class PickupItem {
  PickupItem({
    required this.id,
    required this.date,
    required this.weightKg,
    required this.pointsEarned,
    required this.sorted,
    required this.materialsKg,
  });

  final String id;
  final DateTime date;
  final double weightKg;
  final int pointsEarned;
  final bool sorted;
  final Map<String, double> materialsKg;
}

enum ActivityKind { pickupCompleted, rewardRedeemed }

class ActivityItem {
  ActivityItem({
    required this.kind,
    required this.title,
    required this.date,
    required this.pointsDelta,
    required this.note,
  });

  final ActivityKind kind;
  final String title;
  final DateTime date;
  final int pointsDelta; // + untuk pickup, - untuk redeem
  final String note; // contoh: "8.5 kg" / "Electricity Token"
}

/// ===============================================================
/// CONTROLLER (STATE) — mock data & logic tombol
/// ===============================================================
class AppController extends ChangeNotifier {
  AppController({
    required this.lang,
    required this.user,
    required this.pointsAvailable,
    required this.pointsThisMonth,
    required this.totalPickups,
    required this.nextPickupDate,
    required this.co2SavedKg,
    required this.treesEq,
    required this.waterSavedL,
    required this.energySavedKwh,
    required this.addresses,
    required this.selectedAddressIndex,
    required this.notifications,
    required this.rewards,
    required this.pickups,
    required this.activities,
    required this.rewardsClaimedCount,
  });

  AppLang lang;
  UserProfile user;

  int pointsAvailable;
  int pointsThisMonth;

  int totalPickups;
  DateTime nextPickupDate;

  double co2SavedKg;
  int treesEq;
  int waterSavedL;
  int energySavedKwh;

  List<Address> addresses;
  int selectedAddressIndex;

  NotificationSettings notifications;

  List<RewardItem> rewards;
  List<PickupItem> pickups;
  List<ActivityItem> activities;

  int rewardsClaimedCount;

  String t(String key) => AppStrings.of(lang, key);

  Address get selectedAddress => addresses[selectedAddressIndex];

  void setLanguage(AppLang v) {
    lang = v;
    notifyListeners();
  }

  void togglePickupReminder(bool v) {
    notifications.pickupReminder = v;
    notifyListeners();
  }

  void toggleRewardUpdates(bool v) {
    notifications.rewardUpdates = v;
    notifyListeners();
  }

  void toggleImpactReport(bool v) {
    notifications.impactReport = v;
    notifyListeners();
  }

  bool canRedeem(RewardItem item) => pointsAvailable >= item.costPoints;

  void redeem(RewardItem item) {
    if (!canRedeem(item)) return;

    pointsAvailable -= item.costPoints;
    rewardsClaimedCount += 1;

    activities.insert(
      0,
      ActivityItem(
        kind: ActivityKind.rewardRedeemed,
        title: 'Hadiah Ditukar',
        date: DateTime.now(),
        pointsDelta: -item.costPoints,
        note: item.title,
      ),
    );

    notifyListeners();
  }

  static AppController mock() {
    final user = UserProfile(
      name: 'John Doe',
      email: 'john.doe@email.com',
      location: 'Jakarta, Indonesia',
    );

    final addresses = [
      Address(
        label: 'Rumah',
        line1: '123 Green Street, Eco District',
        line2: 'Jakarta, 12345',
      ),
    ];

    final rewards = <RewardItem>[
      RewardItem(
        id: 'r1',
        title: 'Token Listrik',
        subtitle: 'Kredit listrik 50 kWh',
        costPoints: 500,
        category: RewardCategory.utilitas,
        badgeIcon: Icons.bolt_rounded,
      ),
      RewardItem(
        id: 'r2',
        title: 'Tiket Bioskop',
        subtitle: '2 tiket film',
        costPoints: 600,
        category: RewardCategory.hiburan,
        badgeIcon: Icons.confirmation_number_rounded,
      ),
      RewardItem(
        id: 'r3',
        title: 'Voucher Belanja',
        subtitle: 'Kredit toko \$50',
        costPoints: 1400,
        category: RewardCategory.belanja,
        badgeIcon: Icons.shopping_bag_rounded,
      ),
    ];

    final pickups = <PickupItem>[
      PickupItem(
        id: 'p1',
        date: DateTime(2025, 12, 28),
        weightKg: 8.5,
        pointsEarned: 125,
        sorted: true,
        materialsKg: {'Plastic': 3.2, 'Paper': 2.8, 'Glass': 2.5},
      ),
      PickupItem(
        id: 'p2',
        date: DateTime(2025, 12, 21),
        weightKg: 9.2,
        pointsEarned: 140,
        sorted: true,
        materialsKg: {'Plastic': 3.6, 'Paper': 3.0, 'Glass': 2.6},
      ),
      PickupItem(
        id: 'p3',
        date: DateTime(2025, 12, 14),
        weightKg: 7.8,
        pointsEarned: 115,
        sorted: true,
        materialsKg: {'Plastic': 2.9, 'Paper': 3.2, 'Glass': 1.7},
      ),
      PickupItem(
        id: 'p4',
        date: DateTime(2025, 12, 7),
        weightKg: 6.5,
        pointsEarned: 95,
        sorted: true,
        materialsKg: {'Plastic': 2.1, 'Paper': 2.8, 'Glass': 1.6},
      ),
    ];

    final activities = <ActivityItem>[
      ActivityItem(
        kind: ActivityKind.pickupCompleted,
        title: 'Penjemputan Selesai',
        date: DateTime(2025, 12, 28),
        pointsDelta: 125,
        note: '8.5 kg',
      ),
      ActivityItem(
        kind: ActivityKind.pickupCompleted,
        title: 'Penjemputan Selesai',
        date: DateTime(2025, 12, 21),
        pointsDelta: 140,
        note: '9.2 kg',
      ),
      ActivityItem(
        kind: ActivityKind.rewardRedeemed,
        title: 'Hadiah Ditukar',
        date: DateTime(2025, 12, 18),
        pointsDelta: -500,
        note: 'Electricity Token',
      ),
    ];

    return AppController(
      lang: AppLang.id,
      user: user,
      pointsAvailable: 1250,
      pointsThisMonth: 450,
      totalPickups: 23,
      nextPickupDate: DateTime(2026, 1, 5),
      co2SavedKg: 145.5,
      treesEq: 12,
      waterSavedL: 2340,
      energySavedKwh: 890,
      addresses: addresses,
      selectedAddressIndex: 0,
      notifications: NotificationSettings(
        pickupReminder: true,
        rewardUpdates: true,
        impactReport: true,
      ),
      rewards: rewards,
      pickups: pickups,
      activities: activities,
      rewardsClaimedCount: 3,
    );
  }
}

/// ===============================================================
/// APP SCOPE (InheritedNotifier)
/// ===============================================================
class AppScope extends InheritedNotifier<AppController> {
  const AppScope({
    super.key,
    required AppController controller,
    required super.child,
  }) : super(notifier: controller);

  static AppController of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppScope>();
    assert(scope != null, 'AppScope not found in widget tree');
    return scope!.notifier!;
  }
}

/// ===============================================================
/// MAIN SHELL (BOTTOM NAV)
/// ===============================================================
class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final c = AppScope.of(context);

    final pages = <Widget>[
      const HomeScreen(),
      const RewardsScreen(),
      const HistoryScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: IndexedStack(index: index, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.muted,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        onTap: (i) => setState(() => index = i),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: c.t('home'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.card_giftcard_outlined),
            label: c.t('rewards'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.history),
            label: c.t('history'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            label: c.t('profile'),
          ),
        ],
      ),
    );
  }
}

/// ===============================================================
/// SHARED WIDGETS
/// ===============================================================
class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final c = AppScope.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 6),
      child: Row(
        children: [
          const GloopLogo(),
          Expanded(
            child: Center(
              child: Text(
                c.t('appTitle'),
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.muted,
                ),
              ),
            ),
          ),
          const SizedBox(width: 28), // spacer kanan biar title tetap center
        ],
      ),
    );
  }
}

class GloopLogo extends StatelessWidget {
  const GloopLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/gloop_logo.png',
      height: 28,
      fit: BoxFit.contain,
    );
  }
}

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.color = AppColors.card,
  });

  final Widget child;
  final EdgeInsets padding;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Padding(padding: padding, child: child),
    );
  }
}

String formatInt(int n) {
  final s = n.toString();
  return s.replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (m) => ',');
}

String formatDateShort(DateTime dt, AppLang lang) {
  const monthsEn = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  const monthsId = ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'];
  final m = (lang == AppLang.en ? monthsEn : monthsId)[dt.month - 1];
  return '$m ${dt.day}, ${dt.year}';
}

/// ===============================================================
/// HOME SCREEN (Beranda)
/// ===============================================================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = AppScope.of(context);

    return SafeArea(
      child: Column(
        children: [
          const AppHeader(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              children: [
                _PointsHeroCard(
                  points: c.pointsAvailable,
                  monthlyDelta: c.pointsThisMonth,
                  onSchedule: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${c.t('schedulePickup')} (stub)')),
                    );
                  },
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: _MiniInfoCard(
                        icon: Icons.calendar_month_rounded,
                        iconBg: const Color(0xFFEAF1FF),
                        title: c.t('nextPickup'),
                        value: formatDateShort(c.nextPickupDate, c.lang),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _MiniInfoCard(
                        icon: Icons.show_chart_rounded,
                        iconBg: const Color(0xFFF2E8FF),
                        title: c.t('totalPickups'),
                        value: '${c.totalPickups}',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                _ImpactCard(
                  co2Kg: c.co2SavedKg,
                  treesEq: c.treesEq,
                  waterSavedL: c.waterSavedL,
                  energySavedKwh: c.energySavedKwh,
                ),
                const SizedBox(height: 14),
                _RecentActivityCard(activities: c.activities),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PointsHeroCard extends StatelessWidget {
  const _PointsHeroCard({
    required this.points,
    required this.monthlyDelta,
    required this.onSchedule,
  });

  final int points;
  final int monthlyDelta;
  final VoidCallback onSchedule;

  @override
  Widget build(BuildContext context) {
    final c = AppScope.of(context);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                c.t('yourPoints'),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
              const Spacer(),
              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.white.withOpacity(0.18),
                child: const Icon(Icons.recycling_rounded, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            formatInt(points),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 34,
              height: 1.0,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '+$monthlyDelta ${c.t('thisMonth')}',
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onSchedule,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.primary,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(
                c.t('schedulePickup'),
                style: const TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniInfoCard extends StatelessWidget {
  const _MiniInfoCard({
    required this.icon,
    required this.iconBg,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final Color iconBg;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.text),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 12, color: AppColors.muted, fontWeight: FontWeight.w600)),
                const SizedBox(height: 3),
                Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ImpactCard extends StatelessWidget {
  const _ImpactCard({
    required this.co2Kg,
    required this.treesEq,
    required this.waterSavedL,
    required this.energySavedKwh,
  });

  final double co2Kg;
  final int treesEq;
  final int waterSavedL;
  final int energySavedKwh;

  @override
  Widget build(BuildContext context) {
    final c = AppScope.of(context);
    final progress = math.min(co2Kg / 250.0, 1.0);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.eco_rounded, color: AppColors.primary, size: 18),
              const SizedBox(width: 8),
              Text(c.t('yourImpact'), style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w900)),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Text(c.t('co2Saved'), style: const TextStyle(color: AppColors.muted, fontWeight: FontWeight.w700)),
              const Spacer(),
              Text(
                '${co2Kg.toStringAsFixed(1)} kg',
                style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w900),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              backgroundColor: const Color(0xFFE5E7EB),
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.black87),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _ImpactMetric(
                  icon: Icons.park_rounded,
                  value: '$treesEq',
                  label: 'pohon\nsetara',
                ),
              ),
              Expanded(
                child: _ImpactMetric(
                  icon: Icons.water_drop_rounded,
                  value: formatInt(waterSavedL),
                  label: 'L\nair tersimpan',
                ),
              ),
              Expanded(
                child: _ImpactMetric(
                  icon: Icons.bolt_rounded,
                  value: formatInt(energySavedKwh),
                  label: 'kWh\nenergi tersimpan',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ImpactMetric extends StatelessWidget {
  const _ImpactMetric({
    required this.icon,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 26),
        const SizedBox(height: 6),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w900)),
        const SizedBox(height: 2),
        Text(label, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.muted, fontSize: 11, height: 1.15)),
      ],
    );
  }
}

class _RecentActivityCard extends StatelessWidget {
  const _RecentActivityCard({required this.activities});

  final List<ActivityItem> activities;

  @override
  Widget build(BuildContext context) {
    final c = AppScope.of(context);
    final items = activities.take(3).toList();

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(c.t('recentActivity'), style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w900)),
          const SizedBox(height: 10),
          ...List.generate(items.length, (i) {
            final a = items[i];
            final isPositive = a.pointsDelta >= 0;
            final pointsText = '${isPositive ? '+' : ''}${a.pointsDelta} pts';

            return Column(
              children: [
                if (i != 0) const Divider(height: 18),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(a.title, style: const TextStyle(fontWeight: FontWeight.w800)),
                          const SizedBox(height: 4),
                          Text(
                            formatDateShort(a.date, c.lang),
                            style: const TextStyle(color: AppColors.muted, fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          pointsText,
                          style: TextStyle(
                            color: isPositive ? AppColors.primary : AppColors.danger,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(a.note, style: const TextStyle(color: AppColors.muted, fontSize: 12, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ],
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}

/// ===============================================================
/// REWARDS SCREEN (Hadiah)
/// ===============================================================
class RewardsScreen extends StatefulWidget {
  const RewardsScreen({super.key});

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  RewardCategory? filter; // null = semua

  @override
  Widget build(BuildContext context) {
    final c = AppScope.of(context);

    final filtered = c.rewards.where((r) => filter == null ? true : r.category == filter).toList();

    return SafeArea(
      child: Column(
        children: [
          const AppHeader(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              children: [
                _PointsAvailableCard(points: c.pointsAvailable),
                const SizedBox(height: 12),
                _CategoryChips(
                  filter: filter,
                  onChange: (v) => setState(() => filter = v),
                ),
                const SizedBox(height: 12),
                ...filtered.map((r) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: RewardCard(
                        reward: r,
                        canRedeem: c.canRedeem(r),
                        onRedeem: () {
                          if (!c.canRedeem(r)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(c.t('insufficientPoints'))),
                            );
                            return;
                          }

                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text('${c.t('redeem')} "${r.title}"?'),
                              content: Text('Biaya: ${r.costPoints} poin'),
                              actions: [
                                TextButton(onPressed: () => Navigator.pop(context), child: const Text('Batal')),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    c.redeem(r);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('${c.t('redeemed')}: ${r.title}')),
                                    );
                                  },
                                  child: Text(c.t('redeem')),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PointsAvailableCard extends StatelessWidget {
  const _PointsAvailableCard({required this.points});
  final int points;

  @override
  Widget build(BuildContext context) {
    final c = AppScope.of(context);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  c.t('pointsAvailable'),
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 6),
                Text(
                  formatInt(points),
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 28),
                ),
              ],
            ),
          ),
          const Icon(Icons.card_giftcard_rounded, color: Colors.white, size: 26),
        ],
      ),
    );
  }
}

class _CategoryChips extends StatelessWidget {
  const _CategoryChips({required this.filter, required this.onChange});

  final RewardCategory? filter;
  final void Function(RewardCategory? value) onChange;

  @override
  Widget build(BuildContext context) {
    final c = AppScope.of(context);

    String labelFor(RewardCategory? cat) {
      if (cat == null) return c.t('all');
      switch (cat) {
        case RewardCategory.utilitas:
          return c.t('util');
        case RewardCategory.belanja:
          return c.t('shop');
        case RewardCategory.kuliner:
          return c.t('food');
        case RewardCategory.hiburan:
          return c.t('fun');
      }
    }

    final items = <RewardCategory?>[
      null,
      RewardCategory.utilitas,
      RewardCategory.belanja,
      RewardCategory.kuliner,
      RewardCategory.hiburan,
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items.map((cat) {
          final selected = filter == cat;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              borderRadius: BorderRadius.circular(99),
              onTap: () => onChange(cat),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                  color: selected ? AppColors.softGreen : Colors.white,
                  borderRadius: BorderRadius.circular(99),
                  border: Border.all(color: selected ? AppColors.primary : AppColors.border),
                ),
                child: Text(
                  labelFor(cat),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: selected ? AppColors.primary : AppColors.text,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class RewardCard extends StatelessWidget {
  const RewardCard({
    super.key,
    required this.reward,
    required this.canRedeem,
    required this.onRedeem,
  });

  final RewardItem reward;
  final bool canRedeem;
  final VoidCallback onRedeem;

  @override
  Widget build(BuildContext context) {
    final c = AppScope.of(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            child: Stack(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFE5E7EB),
                        Color(0xFFF9FAFB),
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Icon(Icons.image_outlined, size: 34, color: AppColors.muted),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 16,
                    child: Icon(reward.badgeIcon, size: 18),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(reward.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
                const SizedBox(height: 4),
                Text(reward.subtitle, style: const TextStyle(color: AppColors.muted, fontWeight: FontWeight.w600)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      '${reward.costPoints}',
                      style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(width: 6),
                    const Text('poin', style: TextStyle(color: AppColors.muted, fontWeight: FontWeight.w700)),
                    const Spacer(),
                    SizedBox(
                      height: 34,
                      child: ElevatedButton(
                        onPressed: canRedeem ? onRedeem : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          disabledBackgroundColor: const Color(0xFFBFEBD5),
                          disabledForegroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        child: Text(
                          c.t('redeem'),
                          style: const TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// ===============================================================
/// HISTORY SCREEN (Riwayat)
/// ===============================================================
class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int tab = 0; // 0 = penjemputan, 1 = hadiah

  @override
  Widget build(BuildContext context) {
    final c = AppScope.of(context);

    final totalKg = c.pickups.fold<double>(0, (sum, p) => sum + p.weightKg);
    final totalPoints = c.pickups.fold<int>(0, (sum, p) => sum + p.pointsEarned);

    return SafeArea(
      child: Column(
        children: [
          const AppHeader(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              children: [
                Text(c.t('activityHistory'), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                const SizedBox(height: 10),
                _SegmentedTabs(
                  leftLabel: c.t('pickupsTab'),
                  rightLabel: c.t('rewardsTab'),
                  index: tab,
                  onChange: (i) => setState(() => tab = i),
                ),
                const SizedBox(height: 12),
                AppCard(
                  color: AppColors.softGreen,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(c.t('totalWaste'), style: const TextStyle(color: AppColors.muted, fontWeight: FontWeight.w700)),
                            const SizedBox(height: 6),
                            Text('${totalKg.toStringAsFixed(1)} kg', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(c.t('pointsEarned'), style: const TextStyle(color: AppColors.muted, fontWeight: FontWeight.w700)),
                            const SizedBox(height: 6),
                            Text('+$totalPoints', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: AppColors.primary)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                if (tab == 0) ...[
                  ...c.pickups.map((p) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: PickupCard(pickup: p),
                      )),
                ] else ...[
                  // versi sederhana: tampilkan aktivitas redeem saja
                  ...c.activities
                      .where((a) => a.kind == ActivityKind.rewardRedeemed)
                      .map((a) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: RewardHistoryCard(activity: a),
                          )),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SegmentedTabs extends StatelessWidget {
  const _SegmentedTabs({
    required this.leftLabel,
    required this.rightLabel,
    required this.index,
    required this.onChange,
  });

  final String leftLabel;
  final String rightLabel;
  final int index;
  final void Function(int i) onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(99),
              onTap: () => onChange(0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: index == 0 ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.recycling_rounded, size: 18),
                    const SizedBox(width: 8),
                    Text(leftLabel, style: const TextStyle(fontWeight: FontWeight.w900)),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(99),
              onTap: () => onChange(1),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: index == 1 ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.card_giftcard_rounded, size: 18),
                    const SizedBox(width: 8),
                    Text(rightLabel, style: const TextStyle(fontWeight: FontWeight.w900)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PickupCard extends StatelessWidget {
  const PickupCard({super.key, required this.pickup});
  final PickupItem pickup;

  @override
  Widget build(BuildContext context) {
    final c = AppScope.of(context);

    return AppCard(
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.softGreen,
                child: const Icon(Icons.recycling_rounded, color: AppColors.primary),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Penjemputan #${pickup.id.replaceAll('p', '')}', style: const TextStyle(fontWeight: FontWeight.w900)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.calendar_month_rounded, size: 14, color: AppColors.muted),
                        const SizedBox(width: 6),
                        Text(
                          formatDateShort(pickup.date, c.lang),
                          style: const TextStyle(color: AppColors.muted, fontWeight: FontWeight.w600, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.softGreen,
                  borderRadius: BorderRadius.circular(99),
                  border: Border.all(color: const Color(0xFFCDEEDB)),
                ),
                child: const Text('Dipilah', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w900, fontSize: 12)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(c.t('totalWeight'), style: const TextStyle(color: AppColors.muted, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 6),
                    Text('${pickup.weightKg.toStringAsFixed(1)} kg', style: const TextStyle(fontWeight: FontWeight.w900)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(c.t('pointsEarned'), style: const TextStyle(color: AppColors.muted, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 6),
                    Text('+${pickup.pointsEarned}', style: const TextStyle(fontWeight: FontWeight.w900, color: AppColors.primary)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(c.t('materialsSortedAi'), style: const TextStyle(fontWeight: FontWeight.w900)),
          ),
          const SizedBox(height: 8),
          ...pickup.materialsKg.entries.map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                    ),
                    const SizedBox(width: 10),
                    Expanded(child: Text('${e.key}: ${e.value.toStringAsFixed(1)}kg', style: const TextStyle(fontWeight: FontWeight.w700))),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class RewardHistoryCard extends StatelessWidget {
  const RewardHistoryCard({super.key, required this.activity});
  final ActivityItem activity;

  @override
  Widget build(BuildContext context) {
    final c = AppScope.of(context);
    return AppCard(
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: const Color(0xFFF3F4F6),
            child: const Icon(Icons.card_giftcard_rounded),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(activity.title, style: const TextStyle(fontWeight: FontWeight.w900)),
                const SizedBox(height: 4),
                Text(formatDateShort(activity.date, c.lang), style: const TextStyle(color: AppColors.muted, fontWeight: FontWeight.w600, fontSize: 12)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('${activity.pointsDelta} pts', style: const TextStyle(color: AppColors.danger, fontWeight: FontWeight.w900)),
              const SizedBox(height: 4),
              Text(activity.note, style: const TextStyle(color: AppColors.muted, fontWeight: FontWeight.w600, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}

/// ===============================================================
/// PROFILE SCREEN (Profil) — sesuai screenshot: user card, dampak, bahasa, alamat, notifikasi, pengaturan, keluar
/// ===============================================================
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = AppScope.of(context);

    return SafeArea(
      child: Column(
        children: [
          const AppHeader(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 28),
              children: [
                AppCard(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 26,
                        backgroundColor: AppColors.primary,
                        child: Text(
                          _initials(c.user.name),
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(c.user.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
                            const SizedBox(height: 4),
                            Text(c.user.email, style: const TextStyle(color: AppColors.muted, fontWeight: FontWeight.w600)),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(Icons.location_on_outlined, size: 16, color: AppColors.muted),
                                const SizedBox(width: 6),
                                Text(c.user.location, style: const TextStyle(color: AppColors.muted, fontWeight: FontWeight.w600)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(c.t('impactYou'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          Expanded(
                            child: _StatMini(title: '${c.totalPickups}', subtitle: 'Total\nPenjemputan'),
                          ),
                          Expanded(
                            child: _StatMini(title: '${c.co2SavedKg.toStringAsFixed(0)}kg', subtitle: 'CO₂\nTersimpan'),
                          ),
                          Expanded(
                            child: _StatMini(title: '${c.rewardsClaimedCount}', subtitle: 'Hadiah\nDiklaim'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(c.t('language'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: _LangButton(
                              selected: c.lang == AppLang.id,
                              labelTop: 'ID',
                              labelBottom: 'Bahasa\nIndonesia',
                              onTap: () => c.setLanguage(AppLang.id),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _LangButton(
                              selected: c.lang == AppLang.en,
                              labelTop: 'GB',
                              labelBottom: 'English',
                              onTap: () => c.setLanguage(AppLang.en),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(c.t('pickupAddress'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
                      const SizedBox(height: 12),

                      // alamat utama (seperti UI kamu: highlight hijau muda + chevron)
                      InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Pilih alamat (stub)')),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: AppColors.softGreen,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFFCDEEDB)),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(c.selectedAddress.label, style: const TextStyle(fontWeight: FontWeight.w900)),
                                    const SizedBox(height: 6),
                                    Text(c.selectedAddress.line1, style: const TextStyle(color: AppColors.muted, fontWeight: FontWeight.w600, fontSize: 12)),
                                    const SizedBox(height: 2),
                                    Text(c.selectedAddress.line2, style: const TextStyle(color: AppColors.muted, fontWeight: FontWeight.w600, fontSize: 12)),
                                  ],
                                ),
                              ),
                              const Icon(Icons.chevron_right_rounded, color: AppColors.muted),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('${c.t('addNewAddress')} (stub)')),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.text,
                            side: const BorderSide(color: AppColors.border),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: Text(c.t('addNewAddress'), style: const TextStyle(fontWeight: FontWeight.w900)),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(c.t('notifications'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
                      const SizedBox(height: 12),

                      _NotifTile(
                        icon: Icons.notifications_none_rounded,
                        title: c.t('pickupReminder'),
                        subtitle: c.t('pickupReminderDesc'),
                        value: c.notifications.pickupReminder,
                        onChanged: c.togglePickupReminder,
                      ),
                      const Divider(height: 18),
                      _NotifTile(
                        icon: Icons.notifications_none_rounded,
                        title: c.t('rewardUpdates'),
                        subtitle: c.t('rewardUpdatesDesc'),
                        value: c.notifications.rewardUpdates,
                        onChanged: c.toggleRewardUpdates,
                      ),
                      const Divider(height: 18),
                      _NotifTile(
                        icon: Icons.notifications_none_rounded,
                        title: c.t('impactReport'),
                        subtitle: c.t('impactReportDesc'),
                        value: c.notifications.impactReport,
                        onChanged: c.toggleImpactReport,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(c.t('settings'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
                      const SizedBox(height: 12),
                      _NavTile(
                        icon: Icons.settings_outlined,
                        title: c.t('accountSettings'),
                        onTap: () => _openStub(context, c.t('accountSettings')),
                      ),
                      const Divider(height: 18),
                      _NavTile(
                        icon: Icons.lock_outline_rounded,
                        title: c.t('privacySecurity'),
                        onTap: () => _openStub(context, c.t('privacySecurity')),
                      ),
                      const Divider(height: 18),
                      _NavTile(
                        icon: Icons.support_agent_rounded,
                        title: c.t('helpSupport'),
                        onTap: () => _openStub(context, c.t('helpSupport')),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 14),

                OutlinedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(c.t('logout')),
                        content: const Text('Yakin ingin keluar? (stub)'),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Batal')),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(c.t('logout'), style: const TextStyle(color: AppColors.danger, fontWeight: FontWeight.w900)),
                          ),
                        ],
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.danger,
                    side: const BorderSide(color: Color(0xFFFCA5A5)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  icon: const Icon(Icons.logout_rounded),
                  label: Text(c.t('logout'), style: const TextStyle(fontWeight: FontWeight.w900)),
                ),

                const SizedBox(height: 12),
                const Center(
                  child: Text('GLOOP v1.0.0', style: TextStyle(color: AppColors.muted, fontWeight: FontWeight.w700)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    final a = parts.isNotEmpty ? parts.first[0] : 'J';
    final b = parts.length > 1 ? parts[1][0] : 'D';
    return (a + b).toUpperCase();
  }

  static void _openStub(BuildContext context, String title) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => StubScreen(title: title)));
  }
}

class _StatMini extends StatelessWidget {
  const _StatMini({required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: AppColors.primary)),
        const SizedBox(height: 6),
        Text(subtitle, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.muted, fontWeight: FontWeight.w700, height: 1.2)),
      ],
    );
  }
}

class _LangButton extends StatelessWidget {
  const _LangButton({
    required this.selected,
    required this.labelTop,
    required this.labelBottom,
    required this.onTap,
  });

  final bool selected;
  final String labelTop;
  final String labelBottom;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: selected ? AppColors.softGreen : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: selected ? AppColors.primary : AppColors.border),
        ),
        child: Column(
          children: [
            Text(labelTop, style: const TextStyle(fontWeight: FontWeight.w900)),
            const SizedBox(height: 4),
            Text(labelBottom, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w900)),
          ],
        ),
      ),
    );
  }
}

class _NotifTile extends StatelessWidget {
  const _NotifTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final void Function(bool v) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.muted),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(color: AppColors.muted, fontWeight: FontWeight.w600, fontSize: 12)),
            ],
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeThumbColor: Colors.black87, // mirip UI kamu (toggle gelap)
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: const Color(0xFFE5E7EB),
        ),
      ],
    );
  }
}

class _NavTile extends StatelessWidget {
  const _NavTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Icon(icon, color: AppColors.muted),
            const SizedBox(width: 12),
            Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w900))),
            const Icon(Icons.chevron_right_rounded, color: AppColors.muted),
          ],
        ),
      ),
    );
  }
}

/// ===============================================================
/// STUB SCREEN (untuk menu Pengaturan, dll)
/// ===============================================================
class StubScreen extends StatelessWidget {
  const StubScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppHeader(),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_rounded),
                  ),
                  const SizedBox(width: 6),
                  Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                ],
              ),
            ),
            const Expanded(
              child: Center(
                child: Text('Halaman ini masih stub (belum ada backend/logic).'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
