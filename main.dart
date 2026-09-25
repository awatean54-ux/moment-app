import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

// تخزين الحسابات المسجلة
Map<String, String> registeredUsers = {'مها': '123456'};

// نظام الموسيقى والأجواء والتحكم الشامل
class GlobalMusicController {
  static bool isMusicPlaying = true;
  static String currentTrack = 'لحن لحظة الهادئ 🎶';
  static List<String> playlist = [
    'لحن لحظة الهادئ 🎶',
    'أغنية الذكريات الجميلة ✨',
    'مقطع الحماس والفللة 🎸',
  ];
  static String currentAmbience = 'عادي 🏡';
  static String nightLampColor = 'وردي دافئ 💡';
  static String currentRadioSound = 'إيقاف 🚫';
  static String currentAroma = 'لافندر هادئ 🪻';
}

// ثيمات التطبيق السحرية
class ThemeController {
  static String currentTheme = 'وردي سحري 🌸';

  static Color getPrimaryColor() {
    switch (currentTheme) {
      case 'شتاء ثلجي ❄️': return Colors.cyan;
      case 'غروب دافئ 🌅': return Colors.deepOrange;
      case 'نيون سيبراني ⚡': return Colors.purple;
      default: return Colors.pinkAccent;
    }
  }

  static Color getBackgroundColor() {
    switch (currentTheme) {
      case 'شتاء ثلجي ❄️': return Colors.cyan.shade50;
      case 'غروب دافئ 🌅': return Colors.orange.shade50;
      case 'نيون سيبراني ⚡': return Colors.grey.shade900;
      default: return Colors.pink.shade50;
    }
  }
}

// 1. شاشة تسجيل الدخول
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userController = TextEditingController(text: 'مها');
  final TextEditingController passController = TextEditingController(text: '123456');

  void handleLogin() {
    String username = userController.text.trim();
    String password = passController.text.trim();

    if (registeredUsers.containsKey(username) && registeredUsers[username] == password) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => InteractiveWelcomeScreen(initialName: username),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('❌ اسم المستخدم أو الرقم السري غير صحيح!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock_person_rounded, size: 80, color: Colors.pink),
              SizedBox(height: 15),
              Text('تسجيل الدخول إلى لحظة 💖', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink[800])),
              SizedBox(height: 25),
              TextField(
                controller: userController,
                decoration: InputDecoration(
                  labelText: 'اسم المستخدم',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: passController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'الرقم السري',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                onPressed: handleLogin,
                child: Text('دخول', style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                },
                child: Text('ليس لديك حساب؟ اضغط هنا للتسجيل 📝', style: TextStyle(color: Colors.pink[700])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 2. شاشة تسجيل حساب جديد
class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController newserController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();

  void handleRegister() {
    String username = newserController.text.trim();
    String password = newPassController.text.trim();

    if (username.isNotEmpty && password.isNotEmpty) {
      if (registeredUsers.containsKey(username)) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('⚠️ اسم المستخدم موجود مسبقاً!')));
      } else {
        registeredUsers[username] = password;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('🎉 تم إنشاء الحساب بنجاح!')));
        Navigator.pop(context);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('الرجاء إدخال اسم المستخدم والرقم السري')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(title: Text('إنشاء حساب جديد'), backgroundColor: Colors.pinkAccent),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: newserController, decoration: InputDecoration(labelText: 'اختر اسم مستخدم جديد', filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)))),
            SizedBox(height: 15),
            TextField(controller: newPassController, obscureText: true, decoration: InputDecoration(labelText: 'اختر رقماً سرياً', filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)))),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pink, padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
              onPressed: handleRegister,
              child: Text('تسجيل الحساب', style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

// 3. شاشة إعدادات الملف والترحيب
class InteractiveWelcomeScreen extends StatefulWidget {
  final String initialName;
  InteractiveWelcomeScreen({required this.initialName});

  @override
  _InteractiveWelcomeScreenState createState() => _InteractiveWelcomeScreenState();
}

class _InteractiveWelcomeScreenState extends State<InteractiveWelcomeScreen> {
  late final TextEditingController nameController;
  final TextEditingController emailController = TextEditingController(text: 'maha@moment.app');
  String selectedGender = 'أنثى';
  String selectedStatus = 'متاحة 💖';

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.initialName);
  }

  List<String> getStatuses() {
    if (selectedGender == 'ذكر') {
      return ['متاح 💙', 'مشغول 🎨', 'في عالم الأحلام ✨', 'رايق 🎵'];
    } else {
      return ['متاحة 💖', 'مشغولة 🎨', 'في عالم الأحلام ✨', 'رايقة 🎵'];
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> currentStatuses = getStatuses();
    if (!currentStatuses.contains(selectedStatus)) {
      selectedStatus = currentStatuses.first;
    }

    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.favorite, size: 60, color: Colors.pink),
              SizedBox(height: 15),
              Text('مرحباً بك يا ${nameController.text} 💖', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink[800])),
              SizedBox(height: 25),
              TextField(controller: emailController, decoration: InputDecoration(labelText: 'البريد الإلكتروني', filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)))),
              SizedBox(height: 15),
              TextField(controller: nameController, decoration: InputDecoration(labelText: 'اسم الشخصية', filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)))),
              SizedBox(height: 15),
              DropdownButtonFormField<String>(
                value: selectedGender,
                items: ['أنثى', 'ذكر'].map((String value) => DropdownMenuItem<String>(value: value, child: Text(value))).toList(),
                onChanged: (newValue) => setState(() {
                  selectedGender = newValue!;
                  selectedStatus = getStatuses().first;
                }),
                decoration: InputDecoration(labelText: 'الجنس', filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(height: 15),
              DropdownButtonFormField<String>(
                value: selectedStatus,
                items: currentStatuses.map((String value) => DropdownMenuItem<String>(value: value, child: Text(value))).toList(),
                onChanged: (newValue) => setState(() => selectedStatus = newValue!),
                decoration: InputDecoration(labelText: 'حالة الحساب', filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(height: 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink, padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainDashboardScreen(
                        email: emailController.text,
                        characterName: nameController.text,
                        gender: selectedGender,
                        userStatus: selectedStatus,
                      ),
                    ),
                  );
                },
                child: Text('الانتقال للرئيسية', style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// نماذج البيانات
class InteractionItem {
  final String id;
  final String label;
  final String textResult;
  final int price;
  bool isUnlocked;
  InteractionItem({required this.id, required this.label, required this.textResult, required this.price, this.isUnlocked = false});
}

class HouseModel {
  final String id;
  final String name;
  final Color roofColor;
  final int price;
  bool isUnlocked;
  HouseModel({required this.id, required this.name, required this.roofColor, required this.price, this.isUnlocked = false});
}

class CharacterCustomization {
  String hairStyle;
  Color hairColor;
  String outfit;
  CharacterCustomization({this.hairStyle = 'طويل 👩', this.hairColor = Colors.brown, this.outfit = 'فستان أنيق 👗'});
}

enum BrushType { softPen, thickBrush, neonPen, shapeSticker }

// دالة التحكم الشامل بالموسيقى والأجواء والعطور
void showGlobalMusicDialog(BuildContext context, VoidCallback onUpdate) {
  showDialog(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setDialogState) => AlertDialog(
        title: Text('🎵 الموسيقى وراديو لحظة والأجواء والعطور'),
        content: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SwitchListTile(
                  title: Text(GlobalMusicController.isMusicPlaying ? 'الموسيقى مفعلة 🔊' : 'الموسيقى متوقفة 🔇'),
                  value: GlobalMusicController.isMusicPlaying,
                  onChanged: (val) {
                    GlobalMusicController.isMusicPlaying = val;
                    setDialogState(() {});
                    onUpdate();
                  },
                ),
                Divider(),
                Text('اختر الملحن أو النشيد:', style: TextStyle(fontWeight: FontWeight.bold)),
                ...GlobalMusicController.playlist.map((track) {
                  bool isSelected = GlobalMusicController.currentTrack == track;
                  return ListTile(
                    title: Text(track, style: TextStyle(fontSize: 13)),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: isSelected ? Colors.pink : Colors.grey),
                      onPressed: () {
                        GlobalMusicController.currentTrack = track;
                        GlobalMusicController.isMusicPlaying = true;
                        setDialogState(() {});
                        onUpdate();
                      },
                      child: Text(isSelected ? 'يعمل' : 'اختيار', style: TextStyle(color: Colors.white)),
                    ),
                  );
                }),
                Divider(),
                Text('📻 راديو أصوات الطبيعة:', style: TextStyle(fontWeight: FontWeight.bold)),
                DropdownButton<String>(
                  value: GlobalMusicController.currentRadioSound,
                  items: ['إيقاف 🚫', 'حفيف الشجر 🌳', 'خرير الماء 🌊', 'طقطقة الحطب (الشبة) 🔥'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                  onChanged: (val) {
                    GlobalMusicController.currentRadioSound = val!;
                    setDialogState(() {});
                    onUpdate();
                  },
                ),
                Divider(),
                Text('🌧️ تغيير أجواء الطقس:', style: TextStyle(fontWeight: FontWeight.bold)),
                DropdownButton<String>(
                  value: GlobalMusicController.currentAmbience,
                  items: ['عادي 🏡', 'مطر هادئ 🌧️', 'ثلج متساقط ❄️', 'غروب دافئ 🌅'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                  onChanged: (val) {
                    GlobalMusicController.currentAmbience = val!;
                    setDialogState(() {});
                    onUpdate();
                  },
                ),
                Divider(),
                Text('🪻 العطر الافتراضي للمكان:', style: TextStyle(fontWeight: FontWeight.bold)),
                DropdownButton<String>(
                  value: GlobalMusicController.currentAroma,
                  items: ['لافندر هادئ 🪻', 'فانيليا دافئة 🍨', 'ياسمين منعش 🌸', 'إيقاف 🚫'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                  onChanged: (val) {
                    GlobalMusicController.currentAroma = val!;
                    setDialogState(() {});
                    onUpdate();
                  },
                ),
                SizedBox(height: 10),
                Text('💡 إضاءة النيون الليلية:', style: TextStyle(fontWeight: FontWeight.bold)),
                DropdownButton<String>(
                  value: GlobalMusicController.nightLampColor,
                  items: ['وردي دافئ 💡', 'أزرق سماوي 💡', 'بنفسجي سحري 💡', 'إيقاف 🚫'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                  onChanged: (val) {
                    GlobalMusicController.nightLampColor = val!;
                    setDialogState(() {});
                    onUpdate();
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('إغلاق'))],
      ),
    ),
  );
}

// 4. القائمة الرئيسية
class MainDashboardScreen extends StatefulWidget {
  final String email;
  final String characterName;
  final String gender;
  final String userStatus;
  MainDashboardScreen({required this.email, required this.characterName, required this.gender, required this.userStatus});

  @override
  _MainDashboardScreenState createState() => _MainDashboardScreenState();
}

class _MainDashboardScreenState extends State<MainDashboardScreen> {
  int userPoints = 1200;
  List<Map<String, String>> savedGallery = [];
  CharacterCustomization character = CharacterCustomization();
  List<String> gratitudeList = ['أنا غاية في السعادة بوجود تطبيق لحظة ✨'];
  List<String> timeCapsules = ['رسالة لنفسي بالمستقبل: استمري في الإبداع! ⏳'];
  List<String> secretBottles = ['رسالة زجاجية: من يجد هذه الرسالة فليبتسم اليوم 😊'];
  List<String> myBadges = ['فنان مبتدئ 🎨', 'نشيط الغرفة 🌟', 'مستكشف السحر 🪄'];

  List<String> dreamVault = ['أفكار رسومات لقصة خيالية سحرية 📖'];
  List<String> moodHistory = ['فرحان وسعيد 😊', 'رايق ومبدع 🎨'];
  String currentMood = 'رايق ومبدع 🎨';
  bool mysteryBoxClaimedToday = false;

  List<String> voiceNotes = ['تسجيل صوتي 1: خاطرة إبداعية صباحية 🎙️'];
  List<String> gardenFlowers = ['زهرة النرجس البري 🌼', 'وردة الجوري السحري 🌹'];
  List<String> storyboards = ['مشهد بيكساري: القطة السحرية تطير فوق الغيوم 🎬'];
  List<String> wishingWellItems = ['أمنية: أن تصبح قصتي حقيقة ملهمة ✨'];

  void showDailyMissionsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('🎁 المهام اليومية والأوسمة'),
        content: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.card_giftcard, color: Colors.pink),
                  title: Text('تسجيل الدخول اليومي'),
                  subtitle: Text('+150 نقطة 🪙'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      setState(() => userPoints += 150);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('🎉 حصلت على 150 نقطة بنجاح!')));
                    },
                    child: Text('استلام'),
                  ),
                ),
                Divider(),
                Text('🏆 الأوسمة المكتسبة:', style: TextStyle(fontWeight: FontWeight.bold)),
                Wrap(
                  spacing: 8,
                  children: myBadges.map((b) => Chip(avatar: Icon(Icons.star, color: Colors.amber), label: Text(b))).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showMysteryBoxDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('🎁 صندوق الحظ والمفاجآت اليومي'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.redeem, size: 60, color: Colors.amber),
            SizedBox(height: 10),
            Text(mysteryBoxClaimedToday ? 'لقد فتحت الصندوق اليوم بالفعل! عُد غداً للمزيد 🌟' : 'اضغط لاكتشاف هديتك العشوائية السحرية اليومية!'),
            SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              onPressed: mysteryBoxClaimedToday ? null : () {
                int randomReward = 100 + Random().nextInt(400);
                setState(() {
                  userPoints += randomReward;
                  mysteryBoxClaimedToday = true;
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('🎉 مبروك! ربحت $randomReward نقطة سحرية من صندوق الحظ!')));
              },
              child: Text(mysteryBoxClaimedToday ? 'تم الفتح' : 'افتح الصندوق 🎁', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }

  void showVoiceNotesDialog() {
    final TextEditingController vController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text('🎙️ صانع الذكريات الصوتية السرية'),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(controller: vController, decoration: InputDecoration(hintText: 'اكتب تفاصيل خاطرتك الصوتية...')),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent),
                    icon: Icon(Icons.mic, color: Colors.white),
                    label: Text('حفظ خاطرة صوتية', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      if (vController.text.isNotEmpty) {
                        setState(() => voiceNotes.add('تسجيل: ${vController.text} 🎙️'));
                        vController.clear();
                        setDialogState(() {});
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('🎙️ تم حفظ الذكريات الصوتية بنجاح!')));
                      }
                    },
                  ),
                  Divider(),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 120),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: voiceNotes.length,
                      itemBuilder: (context, i) => Text('• ${voiceNotes[i]}', style: TextStyle(fontSize: 13)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('إغلاق'))],
        ),
      ),
    );
  }

  void showGardenDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('🌸 حديقة الزهور المزهرة'),
        content: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('زُهورك النابتة بفضل طاقاتك الإيجابية والنقاط (🪙):', style: TextStyle(fontSize: 13)),
                SizedBox(height: 10),
                ...gardenFlowers.map((f) => Chip(avatar: Icon(Icons.local_florist, color: Colors.pink), label: Text(f))),
                SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: userPoints >= 50 ? () {
                    setState(() {
                      userPoints -= 50;
                      gardenFlowers.add('زهرة جديدة متألقة 🌺');
                    });
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('🌱 زرعت وردة جديدة في حديقتك السحرية (-50 نقطة)!')));
                  } : null,
                  child: Text('شراء وزرع وردة جديدة (50 نقطة 🪙)', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('إغلاق'))],
      ),
    );
  }

  void showStoryboardDialog() {
    final TextEditingController sbController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text('🎬 استوديو سيناريو الـ 3D Storyboard'),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(controller: sbController, decoration: InputDecoration(hintText: 'اكتب فكرة مشهد بيكساري جديد...')),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (sbController.text.isNotEmpty) {
                        setState(() => storyboards.add('مشهد: ${sbController.text} 🌟'));
                        sbController.clear();
                        setDialogState(() {});
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('🎬 تم حفظ مشهد الستوري بورد بنجاح!')));
                      }
                    },
                    child: Text('إضافة المشهد'),
                  ),
                  Divider(),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 120),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: storyboards.length,
                      itemBuilder: (context, i) => Text('🎥 ${storyboards[i]}', style: TextStyle(fontSize: 12)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('إغلاق'))],
        ),
      ),
    );
  }

  void showWishingWellDialog() {
    final TextEditingController wishController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text('✨ بئر الأمنيات السحري'),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('ارمِ أمنية في البئر ودع السحر يعمل... 🪙✨'),
                  TextField(controller: wishController, decoration: InputDecoration(hintText: 'اكتب أمنيتك هنا...')),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                    onPressed: () {
                      if (wishController.text.isNotEmpty) {
                        setState(() {
                          wishingWellItems.add('أمنية: ${wishController.text} ✨');
                        });
                        wishController.clear();
                        setDialogState(() {});
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('🌠 أُلقيت أمنيتك في البئر بنجاح!')));
                      }
                    },
                    child: Text('رمي الأمنية السحرية'),
                  ),
                  Divider(),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 100),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: wishingWellItems.length,
                      itemBuilder: (context, i) => Text('🌟 ${wishingWellItems[i]}', style: TextStyle(fontSize: 12, color: Colors.purple)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('إغلاق'))],
        ),
      ),
    );
  }

  void showWallpaperCreatorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('📱 صانع الخلفيات الجمالية'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.pink.shade100, Colors.purple.shade200]),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text('“إبداعك وفنك يصنعان فرقاً جميلاً يا مها ✨”', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('📱 تم توليد وحفظ الخلفية الجمالية كصورة أنيقة!')));
              },
              child: Text('حفظ كخلفية للهاتف 🖼️', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  void showAiCompanionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('🤖 المساعد الذكي - جنية لحظة ✨'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.auto_awesome, size: 50, color: Colors.pink),
            SizedBox(height: 10),
            Text('أهلاً بك يا مها! أنا جنية لحظة مرافقتك الدائمة. تذكري شرب الماء، خذِي استراحة قصيرة للرسم، وأنتِ تقومين بأعمال مذهلة اليوم! 💖', textAlign: TextAlign.center),
          ],
        ),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('شكراً لطاقتك اللطيفة 🌸'))],
      ),
    );
  }

  void showCreativeChallengesDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('✨ التحديات اليومية الإبداعية'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.brush, color: Colors.purple),
              title: Text('التحدي الحالي:'),
              subtitle: Text('ارسمي كوب قهوة دافئ أو منظر غروب اليوم ☕🌅'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() => userPoints += 100);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('🌟 ممتاز! أتممت التحدي وحصلت على 100 نقطة!')));
              },
              child: Text('إنجاز التحدي (+100 نقطة)'),
            ),
          ],
        ),
      ),
    );
  }

  void showMoodTrackerDialog() {
    List<String> availableMoods = ['فرحان وسعيد 😊', 'رايق ومبدع 🎨', 'هادئ ومسترخي 🍃', 'متحمس ونشيط ⚡'];
    if (!availableMoods.contains(currentMood)) {
      currentMood = availableMoods.first;
    }

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text('🌈 سجل المزاج اليومي'),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('كيف تقضين يومك اليوم يا مها؟'),
                  SizedBox(height: 10),
                  DropdownButton<String>(
                    value: currentMood,
                    isExpanded: true,
                    items: availableMoods.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                    onChanged: (val) {
                      if (val != null) {
                        setState(() {
                          currentMood = val;
                          moodHistory.add(currentMood);
                        });
                        setDialogState(() {});
                      }
                    },
                  ),
                  Divider(),
                  Text('سجل المزاجات السابقة:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 100),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: moodHistory.length,
                      itemBuilder: (context, i) => Text('• ${moodHistory[i]}', style: TextStyle(fontSize: 12)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('إغلاق'))],
        ),
      ),
    );
  }

  void showAffirmationsDialog() {
    List<String> affirmations = [
      'أنت قادرة على إنجاز أروع الأعمال اليوم ✨',
      'كل خطوة إبداعية تخطينها تقربك لأحلامك 💖',
      'إبداعك وفنك يصنعان فرقاً جميلاً حولك 🌸',
      'استمري بتألقك، ف أنتِ مصدر إلهام رائع 🌟'
    ];
    String randomAffirmation = affirmations[Random().nextInt(affirmations.length)];
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('💬 بطاقة التحفيز الإيجابي'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(color: Colors.pink[50], borderRadius: BorderRadius.circular(15)),
              child: Text(randomAffirmation, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.pink[900])),
            ),
          ],
        ),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('شكراً ✨'))],
      ),
    );
  }

  void showDreamVaultDialog() {
    final TextEditingController dController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text('🔮 دفتر الأفكار والأحلام المجنونة'),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(controller: dController, decoration: InputDecoration(hintText: 'اكتب فكرة أو سيناريو مجنون...')),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (dController.text.isNotEmpty) {
                        setState(() => dreamVault.add(dController.text));
                        dController.clear();
                        setDialogState(() {});
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('🔒 تم حفظ الفكرة في الخزنة السرية!')));
                      }
                    },
                    child: Text('حفظ في الخزنة'),
                  ),
                  Divider(),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 120),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: dreamVault.length,
                      itemBuilder: (context, i) => Text('💡 ${dreamVault[i]}', style: TextStyle(fontSize: 13)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('إغلاق'))],
        ),
      ),
    );
  }

  void showReflectionMirrorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('🪞 مرآة الانعكاس الذاتي'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.auto_awesome, size: 50, color: Colors.purple),
            SizedBox(height: 10),
            Text('عزيزتي مها، انظري خلفكِ وتأملي كم أنجزتِ وابدعتِ! أنتِ تسيرين في الطريق الصحيح تماماً، وطاقتك الإيجابية تضيء كل مكان ترسمين فيه أو تدونين لحظاتك فيه. استمري هكذا دائماً! 🌟', textAlign: TextAlign.center, style: TextStyle(fontSize: 14)),
          ],
        ),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('أنا فخورة بنفسي 💖'))],
      ),
    );
  }

  void showThemeSwitcherDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('🪄 عصا السحر لتغيير الثيمات'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: ['وردي سحري 🌸', 'شتاء ثلجي ❄️', 'غروب دافئ 🌅', 'نيون سيبراني ⚡'].map((theme) => ListTile(
            title: Text(theme),
            trailing: Radio<String>(
              value: theme,
              groupValue: ThemeController.currentTheme,
              onChanged: (val) {
                setState(() => ThemeController.currentTheme = val!);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('🪄 تم تغيير ثيم التطبيق إلى $theme بنجاح!')));
              },
            ),
          )).toList(),
        ),
      ),
    );
  }

  void showGratitudeDialog() {
    final TextEditingController gController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text('✨ مفكرة الامتنان والسعادة'),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(controller: gController, decoration: InputDecoration(hintText: 'اكتب شيئاً جميلاً شعرت به اليوم...')),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (gController.text.isNotEmpty) {
                        setState(() => gratitudeList.add(gController.text));
                        gController.clear();
                        setDialogState(() {});
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('💖 تمت إضافة خاطرتك للسجل بنجاح!')));
                      }
                    },
                    child: Text('حفظ الخاطرة'),
                  ),
                  Divider(),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 150),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: gratitudeList.length,
                      itemBuilder: (context, index) => Text('• ${gratitudeList[index]}', style: TextStyle(color: Colors.pink[800])),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('إغلاق'))],
        ),
      ),
    );
  }

  void showTimeCapsuleDialog() {
    final TextEditingController tController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text('⏳ كبسولة الزمن'),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(controller: tController, decoration: InputDecoration(hintText: 'اكتب رسالة لفتحها مستقبلاً...')),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (tController.text.isNotEmpty) {
                        setState(() => timeCapsules.add(tController.text));
                        tController.clear();
                        setDialogState(() {});
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('🔒 تم حفظ كبسولة الزمن بأمان!')));
                      }
                    },
                    child: Text('حفظ الكبسولة'),
                  ),
                  Divider(),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 150),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: timeCapsules.length,
                      itemBuilder: (context, index) => Text('📦 ${timeCapsules[index]}', style: TextStyle(color: Colors.purple[800])),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('إغلاق'))],
        ),
      ),
    );
  }

  void showSecretBottlesDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('🍾 زجاجات الرسائل السرية'),
        content: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('رسالة عشوائية من بحر اللحظات:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.cyan[50], borderRadius: BorderRadius.circular(10)),
                  child: Text(secretBottles.first, style: TextStyle(fontStyle: FontStyle.italic)),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    setState(() => userPoints += 50);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('🎁 حصلت على 50 نقطة!')));
                  },
                  child: Text('قبول المكافأة 🪙'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showCoffeeCornerDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('☕ ركن القهوة'),
        content: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('اختر مشروبك المفضّل:', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                ListTile(
                  leading: Text('☕', style: TextStyle(fontSize: 24)),
                  title: Text('قهوة مقطرة بالحب'),
                  subtitle: Text('+50 نقاط طاقة'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      setState(() => userPoints += 50);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('☕ بالعافية! تم التحضير بنجاح!')));
                    },
                    child: Text('احتساء'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showCharacterCustomizer() {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text('👗 تخصيص المظهر'),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButton<String>(
                    value: character.hairStyle,
                    items: ['طويل 👩', 'قصير 💇‍♀️', 'كيرلي 🌀'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                    onChanged: (val) => setState(() {
                      character.hairStyle = val!;
                      setDialogState(() {});
                    }),
                  ),
                  DropdownButton<String>(
                    value: character.outfit,
                    items: ['فستان أنيق 👗', 'ملابس كاجوال 👕', 'بدلة رسمية 🧥'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                    onChanged: (val) => setState(() {
                      character.outfit = val!;
                      setDialogState(() {});
                    }),
                  ),
                ],
              ),
            ),
          ),
          actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('تم'))],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeController.getBackgroundColor(),
      appBar: AppBar(
        title: Text('أهلاً بك يا ${widget.characterName} (🪙 $userPoints)'),
        backgroundColor: ThemeController.getPrimaryColor(),
        actions: [
          IconButton(icon: Icon(Icons.card_giftcard), onPressed: showDailyMissionsDialog, tooltip: 'المهام'),
          IconButton(icon: Icon(Icons.checkroom), onPressed: showCharacterCustomizer, tooltip: 'المظهر'),
          IconButton(icon: Icon(Icons.redeem), onPressed: showMysteryBoxDialog, tooltip: 'صندوق الحظ اليومي'),
          IconButton(icon: Icon(Icons.auto_fix_high), onPressed: showThemeSwitcherDialog, tooltip: 'عصا السحر للثيمات'),
          IconButton(
            icon: Icon(GlobalMusicController.isMusicPlaying ? Icons.music_note : Icons.music_off),
            onPressed: () => showGlobalMusicDialog(context, () => setState(() {})),
            tooltip: 'الموسيقى والأجواء',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                leading: Icon(Icons.house, color: Colors.pink, size: 40),
                title: Text('منزل لحظة والمتجر التفاعلي 🏡', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('الرسم، التفاعلات، الطقس والدردشة'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DrawingScreen(
                        characterName: widget.characterName,
                        character: character,
                        onSaveDrawing: (drawingName, thumb) => savedGallery.add({'title': drawingName, 'desc': 'لوحة ابداعية'}),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                leading: Icon(Icons.public, color: Colors.blue, size: 40),
                title: Text('غرفة المجموعات العامة 🌍', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('استعراض وانضمام وإنشاء المجموعات'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GroupsListScreen(characterName: widget.characterName),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[100], foregroundColor: Colors.purple[900]),
                    icon: Icon(Icons.menu_book),
                    label: Text('مفكرة الامتنان'),
                    onPressed: showGratitudeDialog,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.amber[100], foregroundColor: Colors.amber[900]),
                    icon: Icon(Icons.hourglass_empty),
                    label: Text('كبسولة الزمن'),
                    onPressed: showTimeCapsuleDialog,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan[100], foregroundColor: Colors.cyan[900]),
                    icon: Icon(Icons.wine_bar),
                    label: Text('الرسائل الزجاجية'),
                    onPressed: showSecretBottlesDialog,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange[100], foregroundColor: Colors.orange[900]),
                    icon: Icon(Icons.coffee),
                    label: Text('ركن القهوة ☕'),
                    onPressed: showCoffeeCornerDialog,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[100], foregroundColor: Colors.teal[900]),
                    icon: Icon(Icons.star),
                    label: Text('التحديات الإبداعية'),
                    onPressed: showCreativeChallengesDialog,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo[100], foregroundColor: Colors.indigo[900]),
                    icon: Icon(Icons.mood),
                    label: Text('سجل المزاج'),
                    onPressed: showMoodTrackerDialog,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.lime[100], foregroundColor: Colors.lime[900]),
                    icon: Icon(Icons.chat_bubble_outline),
                    label: Text('بطاقات التحفيز'),
                    onPressed: showAffirmationsDialog,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange[100], foregroundColor: Colors.deepOrange[900]),
                    icon: Icon(Icons.lightbulb_outline),
                    label: Text('خزنة الأحلام'),
                    onPressed: showDreamVaultDialog,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.pink[100], foregroundColor: Colors.pink[900]),
                    icon: Icon(Icons.mic),
                    label: Text('ذكريات صوتية 🎙️'),
                    onPressed: showVoiceNotesDialog,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100], foregroundColor: Colors.green[900]),
                    icon: Icon(Icons.local_florist),
                    label: Text('حديقة الزهور 🌸'),
                    onPressed: showGardenDialog,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[100], foregroundColor: Colors.blue[900]),
                    icon: Icon(Icons.movie),
                    label: Text('استوديو 3D 🎬'),
                    onPressed: showStoryboardDialog,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.amber[100], foregroundColor: Colors.amber[900]),
                    icon: Icon(Icons.star_border),
                    label: Text('بئر الأمنيات ✨'),
                    onPressed: showWishingWellDialog,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[100], foregroundColor: Colors.purple[900]),
                    icon: Icon(Icons.wallpaper),
                    label: Text('صانع الخلفيات 📱'),
                    onPressed: showWallpaperCreatorDialog,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.pink[100], foregroundColor: Colors.pink[900]),
                    icon: Icon(Icons.auto_awesome),
                    label: Text('مساعد لحظة 🤖'),
                    onPressed: showAiCompanionDialog,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.pink[100], foregroundColor: Colors.pink[900]),
                    icon: Icon(Icons.pets),
                    label: Text('مرافق حيوان أليف 🐾'),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('🐾 قطة "لحظة" السحرية'),
                          content: Text('القطة ترقص بجانبك ببهجة وترافقك في كل مكان بالمنزل! ✨'),
                          actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('يا حلاتها! 😻'))],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[100], foregroundColor: Colors.purple[900]),
                    icon: Icon(Icons.flare),
                    label: Text('مرآة الانعكاس 🪞'),
                    onPressed: showReflectionMirrorDialog,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber[200], foregroundColor: Colors.black, minimumSize: Size(double.infinity, 45)),
              icon: Icon(Icons.photo_library),
              label: Text('معرض اللوحات المحفوظة (${savedGallery.length}) 🖼️'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('🖼️ معرض لوحاتك الإبداعية'),
                    content: SizedBox(
                      width: double.maxFinite,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: savedGallery.length,
                        itemBuilder: (context, i) => ListTile(
                          leading: Icon(Icons.brush, color: Colors.pink),
                          title: Text(savedGallery[i]['title']!),
                          subtitle: Text(savedGallery[i]['desc']!),
                        ),
                      ),
                    ),
                    actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('إغلاق'))],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// قائمة المجموعات العامة مع إمكانية إنشاء مجموعة جديدة والانضمام
class GroupsListScreen extends StatefulWidget {
  final String characterName;
  GroupsListScreen({required this.characterName});

  @override
  _GroupsListScreenState createState() => _GroupsListScreenState();
}

class _GroupsListScreenState extends State<GroupsListScreen> {
  List<String> chatGroups = [
    'الغرفة العامة 🌍',
    'ركن الرسامين والمبدعين 🎨',
    'جلسة القهوة والروقان ☕',
  ];

  void showCreateGroupDialog() {
    final TextEditingController groupController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('✨ إنشاء مجموعة جديدة'),
        content: TextField(
          controller: groupController,
          decoration: InputDecoration(hintText: 'اكتب اسم المجموعة الجديدة...'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('إلغاء')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
            onPressed: () {
              if (groupController.text.trim().isNotEmpty) {
                setState(() {
                  chatGroups.add(groupController.text.trim());
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('🎉 تم إنشاء المجموعة بنجاح!')));
              }
            },
            child: Text('إنشاء', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('غرف المجموعات العامة 🌍'),
        backgroundColor: Colors.pinkAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle, size: 28),
            onPressed: showCreateGroupDialog,
            tooltip: 'إنشاء مجموعة جديدة',
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(15),
        itemCount: chatGroups.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: Icon(Icons.group, color: Colors.pink, size: 36),
              title: Text(chatGroups[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              subtitle: Text('انقر للدخول وبدء الدردشة الكتابية 💬'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatRoomScreen(roomName: chatGroups[index], characterName: widget.characterName),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// 🌐 شاشة الدردشة الكتابية (محدثة وجاهزة للربط السحابي الفوري)
class ChatRoomScreen extends StatefulWidget {
  final String roomName;
  final String characterName;
  ChatRoomScreen({required this.roomName, required this.characterName});

  @override
  _ChatRoomScreenState createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  // محاكاة قائمة الرسائل (في المستقبل سترتبط بـ Firebase Stream بدلاً من القائمة العادية)
  final List<Map<String, String>> messages = [
    {'sender': 'مها', 'text': 'أهلاً بالجميع في غرفتنا الجميلة! 💖'},
  ];
  final TextEditingController msgController = TextEditingController();

  void sendMessage() {
    if (msgController.text.trim().isNotEmpty) {
      setState(() {
        messages.add({'sender': widget.characterName, 'text': msgController.text.trim()});
      });
      msgController.clear();
      
      // 💡 هنا سيتم إرسال إشعار فوري وتحديث السحابة تلقائياً عند ربط التطبيق بـ Firebase Cloud Messaging
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('✨ تم إرسال الرسالة وتنبيه المتواجدين بالمنزل سحابياً!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.roomName),
        backgroundColor: Colors.pinkAccent,
        actions: [
          IconButton(
            icon: Icon(GlobalMusicController.isMusicPlaying ? Icons.music_note : Icons.music_off),
            onPressed: () => showGlobalMusicDialog(context, () => setState(() {})),
            tooltip: 'الموسيقى',
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                var msg = messages[index];
                bool isMe = msg['sender'] == widget.characterName;
                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isMe ? Colors.pink[100] : Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(msg['sender']!, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey[700])),
                        SizedBox(height: 3),
                        Text(msg['text']!, style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: msgController,
                    decoration: InputDecoration(
                      hintText: 'اكتب رسالتك وتفاعل مع المنزل...',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.pink),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 5. شاشة الرسم والتفاعلات
class DrawingScreen extends StatefulWidget {
  final String characterName;
  final CharacterCustomization character;
  final Function(String, String) onSaveDrawing;
  DrawingScreen({required this.characterName, required this.character, required this.onSaveDrawing});

  @override
  _DrawingScreenState createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  List<DrawnPoint> points = [];
  String interactionText = 'عالم لحظة التفاعلي 💖';
  bool showSpecialEffect = false;
  int userPoints = 1200;
  Color selectedColor = Colors.pink;
  BrushType selectedBrush = BrushType.softPen;
  bool isEraser = false;
  
  final List<HouseModel> availableHouses = [
    HouseModel(id: 'classic', name: 'منزل لحظة الأساسي', roofColor: Colors.pinkAccent, price: 0, isUnlocked: true),
    HouseModel(id: 'cabin', name: 'الكوخ الريفي', roofColor: Colors.brown, price: 150),
    HouseModel(id: 'snow', name: 'الكوخ الثلجي', roofColor: Colors.cyan, price: 250),
  ];
  
  late List<InteractionItem> storeInteractions;
  late HouseModel currentHouse;

  @override
  void initState() {
    super.initState();
    currentHouse = availableHouses[0];
    storeInteractions = [
      InteractionItem(id: 'tap', label: 'طق على الشاشة 👆', textResult: '👋 طق خفيف ومرح على الشاشة!', price: 30, isUnlocked: true),
      InteractionItem(id: 'kick', label: 'ركلة قوية 🥋', textResult: '💥 ${widget.characterName} قامت بركلة كاراتيه سريعة!', price: 40, isUnlocked: true),
      InteractionItem(id: 'kiss', label: 'قبلة 💋', textResult: '😘💋 قبلة مليئة بالحُب والحنان! 💋😘', price: 50, isUnlocked: true),
      InteractionItem(id: 'hug', label: 'حضن دافئ 🤗', textResult: '🤗🫂 حضن دافئ يملأ القلب فرحاً! 🫂🤗', price: 50, isUnlocked: true),
      InteractionItem(id: 'amoutak', label: 'اموتك 💀', textResult: '💥 ${widget.characterName} تقول: اموتك ضحك وونس! 💀', price: 80, isUnlocked: false),
      InteractionItem(id: 'iqal', label: 'عطوني عقال 🧢', textResult: '🤠 ${widget.characterName} تطلب الفزعة: عطوني عقال! 🧢', price: 70, isUnlocked: false),
    ];
  }

  void triggerInteraction(String effectText) {
    setState(() {
      interactionText = effectText;
      showSpecialEffect = true;
    });
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) setState(() => showSpecialEffect = false);
    });
  }

  void saveCurrentDrawing() {
    widget.onSaveDrawing('لوحة بواسطة ${widget.characterName}', 'إبداع فني فريد');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('💾 تم حفظ اللوحة في المعرض بنجاح!')));
  }

  void showColorMatchGameDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('🎨 لعبة تحدي الألوان'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('ما هو الناتج عند دمج اللون الأحمر مع الأزرق؟'),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() => userPoints += 80);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('🎉 إجابة صحيحة! اللون البنفسجي، ربحت 80 نقطة!')));
              },
              child: Text('اللون البنفسجي 🟣'),
            ),
          ],
        ),
      ),
    );
  }

  void showHouseStoreDialog() {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('🏡 المتجر التفاعلي'),
              Chip(backgroundColor: Colors.amber[100], label: Text('🪙 $userPoints', style: TextStyle(fontWeight: FontWeight.bold))),
            ],
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                    icon: Icon(Icons.games),
                    label: Text('لعبة تحدي الألوان (اكسب نقاط 🪙)'),
                    onPressed: showColorMatchGameDialog,
                  ),
                  Divider(),
                  Text('🏡 المنازل:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pink)),
                  ...availableHouses.map((house) => Card(
                    child: ListTile(
                      title: Text(house.name),
                      subtitle: Text('${house.price} نقطة'),
                      trailing: ElevatedButton(
                        onPressed: house.isUnlocked ? () {
                          setState(() => currentHouse = house);
                          setDialogState(() {});
                          Navigator.pop(context);
                        } : () {
                          if (userPoints >= house.price) {
                            setState(() {
                              userPoints -= house.price;
                              house.isUnlocked = true;
                              currentHouse = house;
                            });
                            setDialogState(() {});
                            Navigator.pop(context);
                          }
                        },
                        child: Text(house.isUnlocked ? 'اختر' : 'شراء'),
                      ),
                    ),
                  )),
                  Divider(),
                  Text('✨ التفاعلات:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple)),
                  ...storeInteractions.map((inter) => Card(
                    child: ListTile(
                      title: Text(inter.label),
                      subtitle: Text('${inter.price} نقطة'),
                      trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: inter.isUnlocked ? Colors.grey : Colors.purple),
                        onPressed: inter.isUnlocked ? null : () {
                          if (userPoints >= inter.price) {
                            setState(() {
                              userPoints -= inter.price;
                              inter.isUnlocked = true;
                            });
                            setDialogState(() {});
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('🎉 تمت الإضافة لقائمتك الخاصة!')));
                          }
                        },
                        child: Text(inter.isUnlocked ? 'ممتلك' : 'شراء'),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double strokeWidth = selectedBrush == BrushType.thickBrush ? 12.0 : (selectedBrush == BrushType.neonPen ? 8.0 : 5.0);
    Color brushColor = isEraser ? Colors.transparent : (selectedBrush == BrushType.neonPen ? Colors.cyanAccent : selectedColor);
    
    Color? nightFilterColor;
    if (GlobalMusicController.nightLampColor == 'وردي دافئ 💡') nightFilterColor = Colors.pink.withOpacity(0.15);
    else if (GlobalMusicController.nightLampColor == 'أزرق سماوي 💡') nightFilterColor = Colors.cyan.withOpacity(0.15);
    else if (GlobalMusicController.nightLampColor == 'بنفسجي سحري 💡') nightFilterColor = Colors.deepPurple.withOpacity(0.15);

    return Scaffold(
      appBar: AppBar(
        title: Text('منزل ${widget.characterName} (🪙 $userPoints)'),
        backgroundColor: currentHouse.roofColor,
        actions: [
          IconButton(
            icon: Icon(GlobalMusicController.isMusicPlaying ? Icons.music_note : Icons.music_off),
            onPressed: () => showGlobalMusicDialog(context, () => setState(() {})),
            tooltip: 'الموسيقى والأجواء',
          ),
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatRoomScreen(roomName: 'دردشة منزل ${widget.characterName} 🏡', characterName: widget.characterName),
                ),
              );
            },
            tooltip: 'فتح الدردشة الكتابية بالمنزل',
          ),
          IconButton(icon: Icon(Icons.store), onPressed: showHouseStoreDialog, tooltip: 'المتجر'),
          IconButton(icon: Icon(Icons.save), onPressed: saveCurrentDrawing, tooltip: 'حفظ اللوحة'),
          IconButton(icon: Icon(Icons.delete), onPressed: () => setState(() => points.clear()), tooltip: 'مسح'),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  RenderBox? renderBox = context.findRenderObject() as RenderBox?;
                  if (renderBox != null) {
                    points.add(DrawnPoint(renderBox.globalToLocal(details.globalPosition), brushColor, strokeWidth, selectedBrush));
                  }
                });
              },
              onPanEnd: (details) => setState(() => points.add(DrawnPoint(null, brushColor, strokeWidth, selectedBrush))),
              child: CustomPaint(painter: MultiDrawingPainter(points), size: Size.infinite),
            ),
          ),
          if (GlobalMusicController.currentRadioSound != 'إيقاف 🚫')
            Positioned(
              top: 70, left: 0, right: 0,
              child: IgnorePointer(child: Center(child: Text('📻 راديو شغال: ${GlobalMusicController.currentRadioSound}', style: TextStyle(color: Colors.pink[800], fontSize: 13, fontWeight: FontWeight.bold)))),
            ),
          if (GlobalMusicController.currentAmbience == 'مطر هادئ 🌧️')
            Positioned(
              top: 100, left: 0, right: 0,
              child: IgnorePointer(child: Center(child: Text('🌧️ قطرات المطر تهطل بهدوء...', style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold)))),
            ),
          if (GlobalMusicController.currentAmbience == 'ثلج متساقط ❄️')
            Positioned(
              top: 100, left: 0, right: 0,
              child: IgnorePointer(child: Center(child: Text('❄️ الثلوج تتساقط بسحر...', style: TextStyle(color: Colors.cyan, fontSize: 16, fontWeight: FontWeight.bold)))),
            ),
          if (GlobalMusicController.currentAmbience == 'غروب دافئ 🌅')
            Positioned(
              top: 100, left: 0, right: 0,
              child: IgnorePointer(child: Center(child: Text('🌅 أجوَاء الغروب الدافئة...', style: TextStyle(color: Colors.orange, fontSize: 16, fontWeight: FontWeight.bold)))),
            ),
          if (GlobalMusicController.currentAroma != 'إيقاف 🚫')
            Positioned(
              top: 130, left: 0, right: 0,
              child: IgnorePointer(child: Center(child: Text('🪻 أجواء عطرية: ${GlobalMusicController.currentAroma}', style: TextStyle(color: Colors.purple.shade300, fontSize: 12, fontWeight: FontWeight.bold)))),
            ),
          if (nightFilterColor != null)
            Positioned.fill(child: IgnorePointer(child: Container(color: nightFilterColor))),
          Positioned(
            top: 10, left: 10, right: 10,
            child: Card(
              color: Colors.white.withOpacity(0.9),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(icon: Icon(Icons.brush, color: selectedBrush == BrushType.softPen ? Colors.pink : Colors.grey), onPressed: () => setState(() { selectedBrush = BrushType.softPen; isEraser = false; })),
                    IconButton(icon: Icon(Icons.auto_awesome, color: selectedBrush == BrushType.neonPen ? Colors.cyan : Colors.grey), onPressed: () => setState(() { selectedBrush = BrushType.neonPen; isEraser = false; }), tooltip: 'فرشاة نيون'),
                    IconButton(icon: Icon(Icons.favorite, color: selectedBrush == BrushType.shapeSticker ? Colors.red : Colors.grey), onPressed: () => setState(() { selectedBrush = BrushType.shapeSticker; isEraser = false; }), tooltip: 'قلم القلوب'),
                    IconButton(icon: Icon(Icons.cleaning_services, color: isEraser ? Colors.orange : Colors.grey), onPressed: () => setState(() => isEraser = true), tooltip: 'ممحاة'),
                  ],
                ),
              ),
            ),
          ),
          if (showSpecialEffect)
            Center(
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                child: Text(interactionText, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pink)),
              ),
            ),
          Positioned(
            top: 85, right: 15,
            child: PopupMenuButton<String>(
              icon: Chip(label: Text('التفاعلات 💖')),
              onSelected: (val) {
                var item = storeInteractions.firstWhere(
                  (e) => e.id == val,
                  orElse: () => storeInteractions.first,
                );
                triggerInteraction(item.textResult);
              },
              itemBuilder: (context) => storeInteractions
                  .where((e) => e.isUnlocked)
                  .map((e) => PopupMenuItem<String>(
                        value: e.id,
                        child: Text(e.label),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawnPoint {
  final Offset? offset;
  final Color color;
  final double strokeWidth;
  final BrushType brushType;
  DrawnPoint(this.offset, this.color, this.strokeWidth, this.brushType);
}

class MultiDrawingPainter extends CustomPainter {
  final List<DrawnPoint> points;
  MultiDrawingPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i].offset != null && points[i + 1].offset != null) {
        Paint paint = Paint()
          ..color = points[i].color
          ..strokeCap = StrokeCap.round
          ..strokeWidth = points[i].strokeWidth;
        if (points[i].brushType == BrushType.neonPen) {
          paint.maskFilter = MaskFilter.blur(BlurStyle.outer, 5.0);
        }
        canvas.drawLine(points[i].offset!, points[i + 1].offset!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
