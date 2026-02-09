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
        home: const AppEntry(),
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

  static const fieldBg = Color(0xFFF3F4F6);
  static const purple = Color(0xFF7C3AED);
  static const softPurple = Color(0xFFF5E9FF);
  static const softPurpleBorder = Color(0xFFE9D5FF);
  static const softBlue = Color(0xFFDBEAFE);
  static const blue = Color(0xFF2563EB);
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
      'helpFaqTitle': 'Pertanyaan Umum',
      'helpContactTitle': 'Hubungi Kami',
      'helpContactSubtitle': 'Punya pertanyaan lain? Tim kami siap membantu!',
      'helpSendTitle': 'Kirim Pesan',
      'helpSubject': 'Subjek',
      'helpMessage': 'Pesan',
      'helpMessageHint': 'Tulis pesan Anda...',
      'helpSend': 'Kirim',
      'helpEmailLabel': 'Email',
      'helpPhoneLabel': 'Telepon',
      'helpHoursLabel': 'Jam Operasional',
      'helpHoursValue': 'Senin - Jumat, 9:00 - 17:00 WIB',
      'faq_schedule_q': 'Bagaimana cara menjadwalkan penjemputan?',
      'faq_schedule_a': 'Klik tombol "Jadwalkan Penjemputan" di beranda, pilih tanggal dan waktu yang sesuai, lalu konfirmasi.',
      'faq_points_q': 'Bagaimana cara mendapatkan poin?',
      'faq_points_a': 'Poin diperoleh setiap kali sampah Anda dijemput dan dipilah. Jumlah poin tergantung pada berat dan jenis sampah.',
      'faq_sort_q': 'Apakah saya perlu memilah sampah?',
      'faq_sort_a': 'Tidak! Sistem AI kami akan otomatis memilah sampah Anda di pusat pemrosesan.',
      'faq_redeem_q': 'Bagaimana cara menukar hadiah?',
      'faq_redeem_a': 'Buka halaman Hadiah, pilih hadiah yang diinginkan, dan klik "Tukar". Kode voucher akan dikirim ke email Anda.',
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
      'helpFaqTitle': 'FAQs',
      'helpContactTitle': 'Contact Us',
      'helpContactSubtitle': 'Have a question? Our team is here to help!',
      'helpSendTitle': 'Send a Message',
      'helpSubject': 'Subject',
      'helpMessage': 'Message',
      'helpMessageHint': 'Write your message...',
      'helpSend': 'Send',
      'helpEmailLabel': 'Email',
      'helpPhoneLabel': 'Phone',
      'helpHoursLabel': 'Business Hours',
      'helpHoursValue': 'Mon–Fri, 9:00–17:00 WIB',
      'faq_schedule_q': 'How do I schedule a pickup?',
      'faq_schedule_a': 'Tap "Schedule Pickup" on the Home page, choose a date and time, then confirm.',
      'faq_points_q': 'How do I earn points?',
      'faq_points_a': 'You earn points every time your waste is picked up and sorted. Points depend on weight and waste type.',
      'faq_sort_q': 'Do I need to sort my waste?',
      'faq_sort_a': 'No! Our AI system will sort your waste at the processing center.',
      'faq_redeem_q': 'How do I redeem rewards?',
      'faq_redeem_a': 'Open the Rewards page, pick a reward, then tap "Redeem". Voucher codes will be sent to your email.',
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
    required this.phone,
    required this.location,
  });

  final String name;
  final String email;
  final String phone;
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

enum RedeemStatus { shipped, used }

class RedeemedReward {
  RedeemedReward({
    required this.id,
    required this.title,
    required this.date,
    required this.pointsUsed, // simpan POSITIF, tampilan jadi "-xxx"
    required this.code,
    required this.status,
  });

  final String id;
  final String title;
  final DateTime date;
  final int pointsUsed;
  final String code;
  final RedeemStatus status;
}

class PrivacySecuritySettings {
  PrivacySecuritySettings({
    required this.dataCollection,
    required this.analyticsSharing,
    required this.twoFactor,
    required this.biometricLogin,
    required this.sessionTimeout,
  });

  bool dataCollection;
  bool analyticsSharing;
  bool twoFactor;
  bool biometricLogin;
  bool sessionTimeout;
}

/// ===============================================================
/// CONTROLLER (STATE) — mock data & logic tombol
/// ===============================================================
class AppController extends ChangeNotifier {
  AppController({
    required this.loggedIn,
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
    required this.privacySecurity,
    required this.rewards,
    required this.redeemedRewards,
    required this.pickups,
    required this.activities,
    required this.rewardsClaimedCount,
  });

  bool loggedIn;
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
  PrivacySecuritySettings privacySecurity;

  // riwayat penukaran hadiah (untuk UI tab Hadiah)
  List<RedeemedReward> redeemedRewards;

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

    void loginStub() {
    loggedIn = true;
    notifyListeners();
  }

  void logoutStub() {
    loggedIn = false;
    notifyListeners();
  }
    void updateProfile({
    required String name,
    required String email,
    required String phone,
    required String location,
  }) {
    user = UserProfile(
      name: name,
      email: email,
      phone: phone,
      location: location,
    );
    notifyListeners();
  }

  void toggleDataCollection(bool v) {
    privacySecurity.dataCollection = v;
    notifyListeners();
  }

  void toggleAnalyticsSharing(bool v) {
    privacySecurity.analyticsSharing = v;
    notifyListeners();
  }

  void toggleTwoFactor(bool v) {
    privacySecurity.twoFactor = v;
    notifyListeners();
  }

  void toggleBiometricLogin(bool v) {
    privacySecurity.biometricLogin = v;
    notifyListeners();
  }

  void toggleSessionTimeout(bool v) {
    privacySecurity.sessionTimeout = v;
    notifyListeners();
  }

  int get totalPointsUsed => redeemedRewards.fold<int>(0, (s, r) => s + r.pointsUsed);

  bool canRedeem(RewardItem item) => pointsAvailable >= item.costPoints;

  void redeem(RewardItem item) {
    if (!canRedeem(item)) return;

    pointsAvailable -= item.costPoints;
    rewardsClaimedCount += 1;

      redeemedRewards.insert(
      0,
      RedeemedReward(
        id: 'rr_${DateTime.now().millisecondsSinceEpoch}',
        title: item.title,
        date: DateTime.now(),
        pointsUsed: item.costPoints,
        code: _generateRedeemCode(item.title),
        status: RedeemStatus.shipped,
      ),
    );

    notifyListeners();
  }

  String _generateRedeemCode(String title) {
    final letters = title.replaceAll(RegExp(r'[^A-Za-z]'), '').toUpperCase();
    final prefix = letters.length >= 2 ? letters.substring(0, 2) : 'RW';
    final year = DateTime.now().year;

    const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
    final rng = math.Random();
    final suffix = List.generate(5, (_) => chars[rng.nextInt(chars.length)]).join();

    return '$prefix-$year-$suffix';
  }

  static AppController mock() {
    final user = UserProfile(
      name: 'John Doe',
      email: 'john.doe@email.com',
      phone: '+62 812 3456 7890',
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

    final redeemedRewards = <RedeemedReward>[
      RedeemedReward(
        id: 'rr1',
        title: 'Electricity Token (50 kWh)',
        date: DateTime(2025, 12, 18),
        pointsUsed: 500,
        code: 'ET-2025-AB12C',
        status: RedeemStatus.shipped,
      ),
      RedeemedReward(
        id: 'rr2',
        title: 'Shopping Voucher (\$25)',
        date: DateTime(2025, 11, 25),
        pointsUsed: 750,
        code: 'SV-2025-XY78Z',
        status: RedeemStatus.shipped,
      ),
      RedeemedReward(
        id: 'rr3',
        title: 'Cinema Tickets (2x)',
        date: DateTime(2025, 11, 10),
        pointsUsed: 600,
        code: 'CT-2025-KL34P',
        status: RedeemStatus.used,
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
      loggedIn: false, // ubah true kalau mau langsung masuk ke app
      privacySecurity: PrivacySecuritySettings(
      dataCollection: true,
      analyticsSharing: true,
      twoFactor: false,
      biometricLogin: false,
      sessionTimeout: true,
    ),
    redeemedRewards: redeemedRewards,
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

  final _navKeys = List.generate(4, (_) => GlobalKey<NavigatorState>());

  Future<bool> _onWillPop() async {
    final nav = _navKeys[index].currentState;
    if (nav != null && nav.canPop()) {
      nav.pop();
      return false;
    }
    return true;
  }

  void _onTap(int i) {
    if (i == index) {
      _navKeys[i].currentState?.popUntil((r) => r.isFirst);
      return;
    }
    setState(() => index = i);
  }

  @override
  Widget build(BuildContext context) {
    final c = AppScope.of(context);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: IndexedStack(
          index: index,
          children: [
            _TabNavigator(navigatorKey: _navKeys[0], root: const HomeScreen()),
            _TabNavigator(navigatorKey: _navKeys[1], root: const RewardsScreen()),
            _TabNavigator(navigatorKey: _navKeys[2], root: const HistoryScreen()),
            _TabNavigator(navigatorKey: _navKeys[3], root: const ProfileScreen()),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primary, // di screenshot terlihat lebih “dark grey”
          unselectedItemColor: AppColors.muted,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          onTap: _onTap,
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
      ),
    );
  }
}

class _TabNavigator extends StatelessWidget {
  const _TabNavigator({
    required this.navigatorKey,
    required this.root,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final Widget root;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (_) => MaterialPageRoute(builder: (_) => root),
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

    return Column(
      children: [
        Padding(
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
              const SizedBox(width: 28),
            ],
          ),
        ),
        const Divider(height: 1),
      ],
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
    this.borderColor = AppColors.border,
  });

  final Widget child;
  final EdgeInsets padding;
  final Color color;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
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
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const SchedulePickupScreen()),
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
    final totalPointsEarned = c.pickups.fold<int>(0, (sum, p) => sum + p.pointsEarned);

    final totalRedeemed = c.redeemedRewards.length;
    final totalPointsUsed = c.totalPointsUsed;

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

                // ✅ Summary sesuai tab
                if (tab == 0)
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
                              Text('${totalKg.toStringAsFixed(1)} kg',
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(c.t('pointsEarned'), style: const TextStyle(color: AppColors.muted, fontWeight: FontWeight.w700)),
                              const SizedBox(height: 6),
                              Text(
                                '+$totalPointsEarned',
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: AppColors.primary),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  AppCard(
                    color: AppColors.softPurple,
                    borderColor: AppColors.softPurpleBorder,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Total Ditukar', style: TextStyle(color: AppColors.muted, fontWeight: FontWeight.w700)),
                              const SizedBox(height: 6),
                              Text(
                                '$totalRedeemed hadiah',
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: AppColors.purple),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Poin Digunakan', style: TextStyle(color: AppColors.muted, fontWeight: FontWeight.w700)),
                              const SizedBox(height: 6),
                              Text(
                                formatInt(totalPointsUsed),
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: AppColors.purple),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                const SizedBox(height: 12),

                // ✅ List sesuai tab
                if (tab == 0) ...[
                  ...c.pickups.map((p) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: PickupCard(pickup: p),
                  )),
                ] else ...[
                  ...c.redeemedRewards.map((r) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: RedeemedRewardCard(reward: r),
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

class RedeemedRewardCard extends StatelessWidget {
  const RedeemedRewardCard({super.key, required this.reward});
  final RedeemedReward reward;

  @override
  Widget build(BuildContext context) {
    final c = AppScope.of(context);

    final isShipped = reward.status == RedeemStatus.shipped;
    final statusLabel = isShipped ? 'Terkirim' : 'Digunakan';
    final statusBg = isShipped ? AppColors.softBlue : AppColors.fieldBg;
    final statusFg = isShipped ? AppColors.blue : AppColors.muted;
    final statusBorder = isShipped ? const Color(0xFFBFDBFE) : AppColors.border;

    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.softPurple,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.card_giftcard_rounded, color: AppColors.purple),
              ),
              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(reward.title, style: const TextStyle(fontWeight: FontWeight.w900)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.calendar_month_outlined, size: 14, color: AppColors.muted),
                        const SizedBox(width: 6),
                        Text(
                          formatDateShort(reward.date, c.lang),
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
                  color: statusBg,
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: statusBorder),
                ),
                child: Text(
                  statusLabel,
                  style: TextStyle(color: statusFg, fontWeight: FontWeight.w900, fontSize: 12),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: _KeyValueMini(
                  label: 'Poin Digunakan',
                  value: '-${formatInt(reward.pointsUsed)}',
                  valueColor: AppColors.purple,
                ),
              ),
              Expanded(
                child: _KeyValueMini(
                  label: 'Kode',
                  value: reward.code,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _KeyValueMini extends StatelessWidget {
  const _KeyValueMini({
    required this.label,
    required this.value,
    this.valueColor,
  });

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: AppColors.muted, fontWeight: FontWeight.w700)),
        const SizedBox(height: 6),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: valueColor ?? AppColors.text,
          ),
        ),
      ],
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
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const AccountSettingsScreen()),
                        ),
                      ),
                      const Divider(height: 18),
                      _NavTile(
                        icon: Icons.lock_outline_rounded,
                        title: c.t('privacySecurity'),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const PrivacySecurityScreen()),
                        ),
                      ),
                      const Divider(height: 18),
                      _NavTile(
                        icon: Icons.support_agent_rounded,
                        title: c.t('helpSupport'),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const HelpSupportScreen()),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 14),

                OutlinedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (dialogContext) => LogoutConfirmDialog(
                      onCancel: () => Navigator.pop(dialogContext),
                      onConfirm: () {
                        Navigator.pop(dialogContext);
                        c.logoutStub();
                      },
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.danger,
                  side: const BorderSide(color: Color(0xFFFCA5A5)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.logout_rounded, color: AppColors.danger),
                    SizedBox(width: 8),
                    Text('Keluar', style: TextStyle(fontWeight: FontWeight.w900)),
                  ],
                ),
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
          activeThumbColor: Colors.black87,
          activeTrackColor: const Color(0xFFE5E7EB),
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

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _location = TextEditingController();

  final _passCurrent = TextEditingController();
  final _passNew = TextEditingController();
  final _passConfirm = TextEditingController();

  bool _inited = false;
  bool _obsc1 = true, _obsc2 = true, _obsc3 = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_inited) return;

    final c = AppScope.of(context);
    _name.text = c.user.name;
    _email.text = c.user.email;
    _phone.text = c.user.phone;
    _location.text = c.user.location;

    _inited = true;
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _phone.dispose();
    _location.dispose();
    _passCurrent.dispose();
    _passNew.dispose();
    _passConfirm.dispose();
    super.dispose();
  }

  void _save() {
    final c = AppScope.of(context);

    // update profil (mock)
    c.updateProfile(
      name: _name.text.trim(),
      email: _email.text.trim(),
      phone: _phone.text.trim(),
      location: _location.text.trim(),
    );

    // ubah password (stub + validasi ringan)
    final anyPassFilled = _passCurrent.text.isNotEmpty || _passNew.text.isNotEmpty || _passConfirm.text.isNotEmpty;
    if (anyPassFilled) {
      if (_passNew.text != _passConfirm.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Konfirmasi kata sandi baru tidak cocok')),
        );
        return;
      }
    }

    _passCurrent.clear();
    _passNew.clear();
    _passConfirm.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Perubahan disimpan')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final c = AppScope.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppHeader(),
            _SubPageTopBar(
              title: c.t('accountSettings'),
              onBack: () => Navigator.pop(context),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                children: [
                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Informasi Pribadi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
                        const SizedBox(height: 14),

                        const _FieldLabel('Nama Lengkap'),
                        _SettingsField(controller: _name, hint: 'Nama lengkap'),

                        const SizedBox(height: 10),
                        const _FieldLabel('Email'),
                        _SettingsField(controller: _email, hint: 'Email', keyboardType: TextInputType.emailAddress),

                        const SizedBox(height: 10),
                        const _FieldLabel('Nomor Telepon'),
                        _SettingsField(controller: _phone, hint: '+62 ...', keyboardType: TextInputType.phone),

                        const SizedBox(height: 10),
                        const _FieldLabel('Lokasi'),
                        _SettingsField(controller: _location, hint: 'Kota, Negara'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Ubah Kata Sandi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
                        const SizedBox(height: 14),

                        const _FieldLabel('Kata Sandi Saat Ini'),
                        _SettingsField(
                          controller: _passCurrent,
                          hint: '••••••••',
                          obscureText: _obsc1,
                          suffix: IconButton(
                            onPressed: () => setState(() => _obsc1 = !_obsc1),
                            icon: Icon(_obsc1 ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                          ),
                        ),

                        const SizedBox(height: 10),
                        const _FieldLabel('Kata Sandi Baru'),
                        _SettingsField(
                          controller: _passNew,
                          hint: '••••••••',
                          obscureText: _obsc2,
                          suffix: IconButton(
                            onPressed: () => setState(() => _obsc2 = !_obsc2),
                            icon: Icon(_obsc2 ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                          ),
                        ),

                        const SizedBox(height: 10),
                        const _FieldLabel('Konfirmasi Kata Sandi Baru'),
                        _SettingsField(
                          controller: _passConfirm,
                          hint: '••••••••',
                          obscureText: _obsc3,
                          suffix: IconButton(
                            onPressed: () => setState(() => _obsc3 = !_obsc3),
                            icon: Icon(_obsc3 ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: _save,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  icon: const Icon(Icons.save_rounded),
                  label: const Text('Simpan Perubahan', style: TextStyle(fontWeight: FontWeight.w900)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SubPageTopBar extends StatelessWidget {
  const _SubPageTopBar({required this.title, required this.onBack});
  final String title;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
      child: Row(
        children: [
          IconButton(onPressed: onBack, icon: const Icon(Icons.arrow_back_rounded)),
          const SizedBox(width: 6),
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
        ],
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle(fontWeight: FontWeight.w900));
  }
}

class _SettingsField extends StatelessWidget {
  const _SettingsField({
    required this.controller,
    required this.hint,
    this.keyboardType,
    this.obscureText = false,
    this.suffix,
  });

  final TextEditingController controller;
  final String hint;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.muted, fontWeight: FontWeight.w700),
        suffixIcon: suffix,
        filled: true,
        fillColor: AppColors.fieldBg,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    );
  }
}

class PrivacySecurityScreen extends StatelessWidget {
  const PrivacySecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = AppScope.of(context);
    final s = c.privacySecurity;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppHeader(),
            _SubPageTopBar(
              title: c.t('privacySecurity'),
              onBack: () => Navigator.pop(context),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                children: [
                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Privasi Data', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
                        const SizedBox(height: 12),

                        _SettingSwitchTile(
                          title: 'Pengumpulan Data',
                          subtitle: 'Kami mengumpulkan data untuk meningkatkan layanan',
                          value: s.dataCollection,
                          onChanged: c.toggleDataCollection,
                        ),
                        const Divider(height: 18),

                        _SettingSwitchTile(
                          title: 'Bagikan Data Analitik',
                          subtitle: 'Bantu kami meningkatkan aplikasi dengan data anonim',
                          value: s.analyticsSharing,
                          onChanged: c.toggleAnalyticsSharing,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Keamanan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
                        const SizedBox(height: 12),

                        _SettingSwitchTile(
                          title: 'Autentikasi Dua Faktor',
                          subtitle: 'Tambahkan keamanan ekstra untuk akun Anda',
                          value: s.twoFactor,
                          onChanged: c.toggleTwoFactor,
                        ),
                        const Divider(height: 18),

                        _SettingSwitchTile(
                          title: 'Login Biometrik',
                          subtitle: 'Gunakan sidik jari atau wajah untuk masuk',
                          value: s.biometricLogin,
                          onChanged: c.toggleBiometricLogin,
                        ),
                        const Divider(height: 18),

                        _SettingSwitchTile(
                          title: 'Timeout Sesi',
                          subtitle: 'Keluar otomatis setelah tidak aktif',
                          value: s.sessionTimeout,
                          onChanged: c.toggleSessionTimeout,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Manajemen Data', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
                        const SizedBox(height: 12),

                        _ActionTile(
                          icon: Icons.download_rounded,
                          iconColor: AppColors.primary,
                          borderColor: AppColors.border,
                          title: 'Unduh Data Saya',
                          subtitle: 'Dapatkan salinan data pribadi Anda',
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Unduh data (stub)')),
                            );
                          },
                        ),
                        const SizedBox(height: 10),

                        _ActionTile(
                          icon: Icons.delete_outline_rounded,
                          iconColor: AppColors.danger,
                          borderColor: const Color(0xFFFCA5A5),
                          title: 'Hapus Akun',
                          subtitle: 'Hapus akun dan semua data Anda secara permanen',
                          titleColor: AppColors.danger,
                          subtitleColor: AppColors.danger,
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: const Text('Hapus akun?'),
                                content: const Text('Tindakan ini tidak bisa dibatalkan. (stub)'),
                                actions: [
                                  TextButton(onPressed: () => Navigator.pop(context), child: const Text('Batal')),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      c.logoutStub(); // simulate delete -> balik ke auth
                                    },
                                    child: const Text('Hapus', style: TextStyle(color: AppColors.danger, fontWeight: FontWeight.w900)),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  int? _expandedIndex;

  final _subject = TextEditingController();
  final _message = TextEditingController();

  final _faqs = const <_FaqEntry>[
    _FaqEntry(qKey: 'faq_schedule_q', aKey: 'faq_schedule_a'),
    _FaqEntry(qKey: 'faq_points_q', aKey: 'faq_points_a'),
    _FaqEntry(qKey: 'faq_sort_q', aKey: 'faq_sort_a'),
    _FaqEntry(qKey: 'faq_redeem_q', aKey: 'faq_redeem_a'),
  ];

  @override
  void dispose() {
    _subject.dispose();
    _message.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final c = AppScope.of(context);

    final s = _subject.text.trim();
    final m = _message.text.trim();

    if (s.isEmpty || m.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(c.lang == AppLang.en ? 'Please fill subject & message' : 'Lengkapi subjek & pesan')),
      );
      return;
    }

    // Stub: belum ada backend
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(c.lang == AppLang.en ? 'Message sent (stub)' : 'Pesan terkirim (stub)')),
    );

    _subject.clear();
    _message.clear();
  }

  @override
  Widget build(BuildContext context) {
    final c = AppScope.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppHeader(),
            _SubPageTopBar(
              title: c.t('helpSupport'),
              onBack: () => Navigator.pop(context),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                children: [
                  // ================== FAQ ==================
                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          c.t('helpFaqTitle'),
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(height: 12),
                        ...List.generate(_faqs.length, (i) {
                          final f = _faqs[i];
                          final expanded = _expandedIndex == i;

                          return Padding(
                            padding: EdgeInsets.only(bottom: i == _faqs.length - 1 ? 0 : 10),
                            child: _FaqTile(
                              title: c.t(f.qKey),
                              body: c.t(f.aKey),
                              expanded: expanded,
                              onTap: () {
                                setState(() {
                                  _expandedIndex = expanded ? null : i;
                                });
                              },
                            ),
                          );
                        }),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // ================== CONTACT ==================
                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          c.t('helpContactTitle'),
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          c.t('helpContactSubtitle'),
                          style: const TextStyle(color: AppColors.muted, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 12),

                        _ContactInfoTile(
                          icon: Icons.mail_outline_rounded,
                          label: c.t('helpEmailLabel'),
                          value: 'support@gloop.id',
                        ),
                        const SizedBox(height: 10),
                        _ContactInfoTile(
                          icon: Icons.call_outlined,
                          label: c.t('helpPhoneLabel'),
                          value: '+62 21 1234 5678',
                        ),
                        const SizedBox(height: 10),
                        _ContactInfoTile(
                          icon: Icons.access_time_rounded,
                          label: c.t('helpHoursLabel'),
                          value: c.t('helpHoursValue'),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // ================== SEND MESSAGE ==================
                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          c.t('helpSendTitle'),
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(height: 14),

                        Text(c.t('helpSubject'), style: const TextStyle(fontWeight: FontWeight.w900)),
                        const SizedBox(height: 8),
                        _HelpTextField(
                          controller: _subject,
                          hint: '',
                          minLines: 1,
                          maxLines: 1,
                        ),

                        const SizedBox(height: 12),

                        Text(c.t('helpMessage'), style: const TextStyle(fontWeight: FontWeight.w900)),
                        const SizedBox(height: 8),
                        _HelpTextField(
                          controller: _message,
                          hint: c.t('helpMessageHint'),
                          minLines: 4,
                          maxLines: 6,
                        ),

                        const SizedBox(height: 14),

                        SizedBox(
                          width: double.infinity,
                          height: 44,
                          child: ElevatedButton.icon(
                            onPressed: _sendMessage,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            icon: const Icon(Icons.send_rounded),
                            label: Text(
                              c.t('helpSend'),
                              style: const TextStyle(fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FaqEntry {
  const _FaqEntry({required this.qKey, required this.aKey});
  final String qKey;
  final String aKey;
}

class _FaqTile extends StatelessWidget {
  const _FaqTile({
    required this.title,
    required this.body,
    required this.expanded,
    required this.onTap,
  });

  final String title;
  final String body;
  final bool expanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
                AnimatedRotation(
                  turns: expanded ? 0.5 : 0.0,
                  duration: const Duration(milliseconds: 160),
                  child: const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.muted),
                ),
              ],
            ),
            AnimatedCrossFade(
              firstChild: const SizedBox(height: 0),
              secondChild: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  body,
                  style: const TextStyle(color: AppColors.muted, fontWeight: FontWeight.w700, height: 1.35),
                ),
              ),
              crossFadeState: expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 160),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactInfoTile extends StatelessWidget {
  const _ContactInfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.fieldBg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.border),
            ),
            child: Icon(icon, color: AppColors.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(color: AppColors.muted, fontWeight: FontWeight.w700, fontSize: 12)),
                const SizedBox(height: 2),
                Text(value, style: const TextStyle(fontWeight: FontWeight.w900)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HelpTextField extends StatelessWidget {
  const _HelpTextField({
    required this.controller,
    required this.hint,
    required this.minLines,
    required this.maxLines,
  });

  final TextEditingController controller;
  final String hint;
  final int minLines;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.muted, fontWeight: FontWeight.w700),
        filled: true,
        fillColor: AppColors.fieldBg,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
    );
  }
}

class _SettingSwitchTile extends StatelessWidget {
  const _SettingSwitchTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final String subtitle;
  final bool value;
  final void Function(bool v) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(color: AppColors.muted, fontWeight: FontWeight.w600, fontSize: 12),
              ),
            ],
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeThumbColor: Colors.black87,
          activeTrackColor: const Color(0xFFE5E7EB),
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: const Color(0xFFE5E7EB),
        ),
      ],
    );
  }
}

class _ActionTile extends StatelessWidget {
  const _ActionTile({
    required this.icon,
    required this.iconColor,
    required this.borderColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.titleColor,
    this.subtitleColor,
  });

  final IconData icon;
  final Color iconColor;
  final Color borderColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color? titleColor;
  final Color? subtitleColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: borderColor),
              ),
              child: Icon(icon, color: iconColor),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.w900, color: titleColor ?? AppColors.text),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: subtitleColor ?? AppColors.muted,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum WasteEstimate { kecil, sedang, besar }

class SchedulePickupScreen extends StatefulWidget {
  const SchedulePickupScreen({super.key});

  @override
  State<SchedulePickupScreen> createState() => _SchedulePickupScreenState();
}

class _SchedulePickupScreenState extends State<SchedulePickupScreen> {
  final dates = <DateTime>[
    DateTime(2026, 1, 2),
    DateTime(2026, 1, 3),
    DateTime(2026, 1, 5),
    DateTime(2026, 1, 6),
    DateTime(2026, 1, 8),
    DateTime(2026, 1, 9),
  ];

  final times = const [
    '08:00 - 10:00',
    '10:00 - 12:00',
    '12:00 - 14:00',
    '14:00 - 16:00',
    '16:00 - 18:00',
  ];

  late DateTime selectedDate;
  late String selectedTime;
  WasteEstimate estimate = WasteEstimate.sedang;

  @override
  void initState() {
    super.initState();
    selectedDate = dates.first;
    selectedTime = times.first;
  }

  @override
  Widget build(BuildContext context) {
    final c = AppScope.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppHeader(),

            _PageTopBar(
              title: 'Jadwalkan Penjemputan',
              onBack: () => Navigator.pop(context),
            ),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 24),
                children: [
                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.location_on_outlined, size: 18, color: AppColors.muted),
                            SizedBox(width: 8),
                            Text(
                              'Alamat Penjemputan',
                              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          c.selectedAddress.line1,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          c.selectedAddress.line2,
                          style: const TextStyle(color: AppColors.muted, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Ubah alamat (stub)')),
                            );
                          },
                          child: const Text(
                            'Ubah alamat',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w900,
                            ),
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
                        Row(
                          children: const [
                            Icon(Icons.calendar_month_outlined, size: 18, color: AppColors.muted),
                            SizedBox(width: 8),
                            Text(
                              'Pilih Tanggal',
                              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        LayoutBuilder(
                          builder: (context, cons) {
                            const gap = 10.0;
                            final w = (cons.maxWidth - gap * 2) / 3;

                            return Wrap(
                              spacing: gap,
                              runSpacing: gap,
                              children: dates.map((d) {
                                final selected = _sameDay(d, selectedDate);
                                return SizedBox(
                                  width: w,
                                  child: _SelectBox(
                                    selected: selected,
                                    onTap: () => setState(() => selectedDate = d),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${_monthShort(d.month)} ${d.day}',
                                          style: const TextStyle(fontWeight: FontWeight.w900),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          '${d.year}',
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: AppColors.muted,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.access_time_rounded, size: 18, color: AppColors.muted),
                            SizedBox(width: 8),
                            Text(
                              'Pilih Waktu',
                              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        ...times.map((t) {
                          final selected = t == selectedTime;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: _SelectBox(
                              selected: selected,
                              height: 46,
                              alignCenter: false,
                              onTap: () => setState(() => selectedTime = t),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 14),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    t,
                                    style: const TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.inventory_2_outlined, size: 18, color: AppColors.muted),
                            SizedBox(width: 8),
                            Text(
                              'Perkiraan Jumlah Sampah',
                              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        LayoutBuilder(
                          builder: (context, cons) {
                            const gap = 10.0;
                            final w = (cons.maxWidth - gap * 2) / 3;

                            Widget opt({
                              required String title,
                              required String range,
                              required String pts,
                              required bool selected,
                              required VoidCallback onTap,
                            }) {
                              return SizedBox(
                                width: w,
                                child: _SelectBox(
                                  selected: selected,
                                  height: 74,
                                  onTap: onTap,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
                                      const SizedBox(height: 4),
                                      Text(range, style: const TextStyle(fontSize: 12, color: AppColors.muted, fontWeight: FontWeight.w700)),
                                      const SizedBox(height: 4),
                                      Text(pts, style: const TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.w900)),
                                    ],
                                  ),
                                ),
                              );
                            }

                            return Wrap(
                              spacing: gap,
                              runSpacing: gap,
                              children: [
                                opt(
                                  title: 'Kecil',
                                  range: '< 5 kg',
                                  pts: '~50 pts',
                                  selected: estimate == WasteEstimate.kecil,
                                  onTap: () => setState(() => estimate = WasteEstimate.kecil),
                                ),
                                opt(
                                  title: 'Sedang',
                                  range: '5-10 kg',
                                  pts: '~100 pts',
                                  selected: estimate == WasteEstimate.sedang,
                                  onTap: () => setState(() => estimate = WasteEstimate.sedang),
                                ),
                                opt(
                                  title: 'Besar',
                                  range: '> 10 kg',
                                  pts: '~150 pts',
                                  selected: estimate == WasteEstimate.besar,
                                  onTap: () => setState(() => estimate = WasteEstimate.besar),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAF3FF),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFBFDBFE)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(Icons.lightbulb_outline_rounded, size: 18, color: AppColors.muted),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Tip: Tidak perlu dipilah! Sistem AI kami akan otomatis mengidentifikasi dan memilah sampah Anda di pusat pemrosesan.',
                            style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.muted, height: 1.35),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Jadwal penjemputan dikonfirmasi (stub).')),
                        );
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text(
                        'Konfirmasi Jadwal Penjemputan',
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _sameDay(DateTime a, DateTime b) => a.year == b.year && a.month == b.month && a.day == b.day;

  String _monthShort(int m) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'];
    return months[m - 1];
  }
}

class _PageTopBar extends StatelessWidget {
  const _PageTopBar({
    required this.title,
    required this.onBack,
  });

  final String title;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 6),
      child: Row(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: onBack,
            child: Row(
              children: const [
                Icon(Icons.arrow_back_rounded, size: 18),
                SizedBox(width: 6),
                Text('Kembali', style: TextStyle(fontWeight: FontWeight.w900)),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
            ),
          ),
          const SizedBox(width: 70), // biar title “kelihatan” center (mirip screenshot)
        ],
      ),
    );
  }
}

class _SelectBox extends StatelessWidget {
  const _SelectBox({
    required this.selected,
    required this.onTap,
    required this.child,
    this.height = 56,
    this.alignCenter = true,
  });

  final bool selected;
  final VoidCallback onTap;
  final Widget child;
  final double height;
  final bool alignCenter;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: selected ? AppColors.softGreen : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: selected ? AppColors.primary : AppColors.border),
        ),
        child: alignCenter ? Center(child: child) : child,
      ),
    );
  }
}

class AppEntry extends StatelessWidget {
  const AppEntry({super.key});

  @override
  Widget build(BuildContext context) {
    final c = AppScope.of(context);
    return c.loggedIn ? const MainShell() : const AuthFlow();
  }
}

class AuthFlow extends StatefulWidget {
  const AuthFlow({super.key});

  @override
  State<AuthFlow> createState() => _AuthFlowState();
}

class _AuthFlowState extends State<AuthFlow> {
  bool showLogin = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 180),
      child: showLogin
          ? LoginScreen(
              key: const ValueKey('login'),
              onGoToSignup: () => setState(() => showLogin = false),
            )
          : SignupScreen(
              key: const ValueKey('signup'),
              onGoToLogin: () => setState(() => showLogin = true),
            ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.onGoToSignup});
  final VoidCallback onGoToSignup;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final pass = TextEditingController();
  bool obscure = true;

  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = AppScope.of(context);

    return Scaffold(
      backgroundColor: AppColors.softGreen,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 26, 16, 26),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/gloop_logo.png',
                    height: 84,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Masuk ke GLOOP',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Kelola sampah Anda, selamatkan lingkungan',
                    style: TextStyle(color: AppColors.muted, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 14),

                  _AuthCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _AuthLabel('Email'),
                        const SizedBox(height: 6),
                        _AuthField(
                          controller: email,
                          hint: 'nama@email.com',
                          icon: Icons.mail_outline_rounded,
                        ),
                        const SizedBox(height: 12),

                        const _AuthLabel('Kata Sandi'),
                        const SizedBox(height: 6),
                        _AuthField(
                          controller: pass,
                          hint: 'Masukkan kata sandi',
                          icon: Icons.lock_outline_rounded,
                          obscureText: obscure,
                          suffix: IconButton(
                            onPressed: () => setState(() => obscure = !obscure),
                            icon: Icon(obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                          ),
                        ),
                        const SizedBox(height: 10),

                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Lupa kata sandi? (stub)')),
                              );
                            },
                            child: const Text(
                              'Lupa kata sandi?',
                              style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              c.loginStub();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: const Text('Masuk', style: TextStyle(fontWeight: FontWeight.w900)),
                          ),
                        ),

                        const SizedBox(height: 14),
                        const _OrDivider(),
                        const SizedBox(height: 12),

                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Login dengan Google (stub)')),
                              );
                              c.loginStub();
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.text,
                              side: const BorderSide(color: AppColors.border),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                _GoogleBadge(),
                                SizedBox(width: 10),
                                Text('Lanjutkan dengan Google', style: TextStyle(fontWeight: FontWeight.w900)),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Belum punya akun? ', style: TextStyle(color: AppColors.muted, fontWeight: FontWeight.w700)),
                            InkWell(
                              onTap: widget.onGoToSignup,
                              child: const Text('Daftar', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w900)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key, required this.onGoToLogin});
  final VoidCallback onGoToLogin;

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController(text: '+62 812 3456 7890');
  final pass = TextEditingController();
  final pass2 = TextEditingController();

  bool obscure1 = true;
  bool obscure2 = true;
  bool agree = false;

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    pass.dispose();
    pass2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = AppScope.of(context);

    return Scaffold(
      backgroundColor: AppColors.softGreen,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 26, 16, 26),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/gloop_logo.png',
                    height: 84,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Daftar GLOOP',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Mulai perjalanan ramah lingkungan Anda',
                    style: TextStyle(color: AppColors.muted, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 14),

                  _AuthCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _AuthLabel('Nama Lengkap'),
                        const SizedBox(height: 6),
                        _AuthField(
                          controller: name,
                          hint: 'Masukkan nama lengkap',
                          icon: Icons.person_outline_rounded,
                        ),
                        const SizedBox(height: 12),

                        const _AuthLabel('Email'),
                        const SizedBox(height: 6),
                        _AuthField(
                          controller: email,
                          hint: 'nama@email.com',
                          icon: Icons.mail_outline_rounded,
                        ),
                        const SizedBox(height: 12),

                        const _AuthLabel('Nomor Telepon'),
                        const SizedBox(height: 6),
                        _AuthField(
                          controller: phone,
                          hint: '+62 ...',
                          icon: Icons.call_outlined,
                        ),
                        const SizedBox(height: 12),

                        const _AuthLabel('Kata Sandi'),
                        const SizedBox(height: 6),
                        _AuthField(
                          controller: pass,
                          hint: 'Buat kata sandi',
                          icon: Icons.lock_outline_rounded,
                          obscureText: obscure1,
                          suffix: IconButton(
                            onPressed: () => setState(() => obscure1 = !obscure1),
                            icon: Icon(obscure1 ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                          ),
                        ),
                        const SizedBox(height: 12),

                        const _AuthLabel('Konfirmasi Kata Sandi'),
                        const SizedBox(height: 6),
                        _AuthField(
                          controller: pass2,
                          hint: 'Ulangi kata sandi',
                          icon: Icons.lock_outline_rounded,
                          obscureText: obscure2,
                          suffix: IconButton(
                            onPressed: () => setState(() => obscure2 = !obscure2),
                            icon: Icon(obscure2 ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                          ),
                        ),
                        const SizedBox(height: 10),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: agree,
                              onChanged: (v) => setState(() => agree = v ?? false),
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity.compact,
                              activeColor: Colors.black87,
                              checkColor: Colors.white,
                              side: const BorderSide(color: AppColors.border),
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: RichText(
                                text: const TextSpan(
                                  style: TextStyle(color: AppColors.muted, fontWeight: FontWeight.w700, height: 1.25),
                                  children: [
                                    TextSpan(text: 'Saya setuju dengan '),
                                    TextSpan(text: 'Syarat & Ketentuan', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w900)),
                                    TextSpan(text: ' dan '),
                                    TextSpan(text: 'Kebijakan Privasi', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w900)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: agree
                                ? () {
                                    // stub: langsung login saja
                                    c.loginStub();
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              disabledBackgroundColor: const Color(0xFFBFEBD5),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: const Text('Buat Akun', style: TextStyle(fontWeight: FontWeight.w900)),
                          ),
                        ),

                        const SizedBox(height: 14),
                        const _OrDivider(),
                        const SizedBox(height: 12),

                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Daftar dengan Google (stub)')),
                              );
                              c.loginStub();
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.text,
                              side: const BorderSide(color: AppColors.border),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                _GoogleBadge(),
                                SizedBox(width: 10),
                                Text('Daftar dengan Google', style: TextStyle(fontWeight: FontWeight.w900)),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Sudah punya akun? ', style: TextStyle(color: AppColors.muted, fontWeight: FontWeight.w700)),
                            InkWell(
                              onTap: widget.onGoToLogin,
                              child: const Text('Masuk', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w900)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// ---------- Small building blocks (biar mirip screenshot) ----------

class _AuthCard extends StatelessWidget {
  const _AuthCard({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: child,
    );
  }
}

class _AuthLabel extends StatelessWidget {
  const _AuthLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle(fontWeight: FontWeight.w900));
  }
}

class _AuthField extends StatelessWidget {
  const _AuthField({
    required this.controller,
    required this.hint,
    required this.icon,
    this.obscureText = false,
    this.suffix,
  });

  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool obscureText;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.muted, fontWeight: FontWeight.w700),
        prefixIcon: Icon(icon, color: AppColors.muted),
        suffixIcon: suffix,
        filled: true,
        fillColor: const Color(0xFFF3F4F6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    );
  }
}

class _OrDivider extends StatelessWidget {
  const _OrDivider();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: Divider(height: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text('atau', style: TextStyle(color: AppColors.muted, fontWeight: FontWeight.w800)),
        ),
        Expanded(child: Divider(height: 1)),
      ],
    );
  }
}

class _GoogleBadge extends StatelessWidget {
  const _GoogleBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.border),
      ),
      child: const Text('G', style: TextStyle(fontWeight: FontWeight.w900)),
    );
  }
}

class LogoutConfirmDialog extends StatelessWidget {
  const LogoutConfirmDialog({
    super.key,
    required this.onConfirm,
    required this.onCancel,
  });

  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Konfirmasi Keluar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Apakah Anda yakin ingin keluar dari akun Anda?',
              style: TextStyle(color: AppColors.muted, fontWeight: FontWeight.w700, height: 1.3),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 14),

            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                onPressed: onConfirm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.danger,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Ya, Keluar', style: TextStyle(fontWeight: FontWeight.w900)),
              ),
            ),
            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              height: 44,
              child: OutlinedButton(
                onPressed: onCancel,
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.text,
                  side: const BorderSide(color: AppColors.border),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Batal', style: TextStyle(fontWeight: FontWeight.w900)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
