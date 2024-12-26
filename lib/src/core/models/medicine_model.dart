import 'package:pill_alert/src/core/app_constants.dart/app_images.dart';

class MedicineModel {
  final int id;
  final String name;
  final String image;
  final List<String> similars;
  final String dose;
  final String sideEffects;
  final String tips;

  MedicineModel({
    required this.id,
    required this.name,
    required this.image,
    required this.similars,
    required this.dose,
    required this.sideEffects,
    required this.tips,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) {
    return MedicineModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      similars: List<String>.from(json['similars']),
      dose: json['dose'],
      sideEffects: json['side_effects'],
      tips: json['tips'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'similars': similars,
      'dose': dose,
      'side_effects': sideEffects,
      'tips': tips,
    };
  }
}

final List<MedicineModel> medicines = [
  MedicineModel(
    id: 1,
    name: "Atacand 16mg",
    image: AppImages.medicine0,
    similars: ["Albustix 16mg", "Candalkan16mg"],
    dose: "One tablet every 24 hours with or without food.",
    sideEffects:
        "1. Headache, Low blood pressure which may make you feel dizzy.\n"
        "2. Increased potassium level which may cause fatigue, weakness, irregular heartbeat, or tingling.",
    tips:
        "1. If you have diabetes, do not take Atacand with any medication that contains aliskiren (a blood pressure medicine).\n"
        "2. Tell your doctor if you have kidney disease (or if you are on dialysis).",
  ),
  MedicineModel(
    id: 2,
    name: "Concor 5mg",
    image: AppImages.medicine1,
    similars: ["Bisocard 5mg", "Bisolock 5mg"],
    dose:
        "One tablet every 24 hours in the morning swallowed with water (not to be chewed) with or without food.",
    sideEffects:
        "Headache, dizziness, sleep problems, joint pain, diarrhea, constipation, nausea.",
    tips: "1. Monitor your blood pressure regularly.\n"
        "2. Take the missed dose as soon as you remember. Skip the missed dose if it is almost time for the next dose.\n"
        "3. It may mask some symptoms of low blood glucose, therefore diabetic patients should closely monitor their blood sugar levels.",
  ),
  MedicineModel(
    id: 3,
    name: "Erastapex 40mg",
    image: AppImages.medicine2,
    similars: ["Normesar 40mg", "Angiosartan 40mg", "Lezberg 40mg"],
    dose: "One tablet every 24 hours after breakfast meal.",
    sideEffects:
        "Dizziness, headache, fatigue, nausea or vomiting, low blood pressure, diarrhea, back pain or joint pain, cough.",
    tips: "Should be adequately hydrated to avoid induced low blood pressure.",
  ),
  MedicineModel(
    id: 4,
    name: "SelokenZoc 50mg",
    image: AppImages.medicine3,
    similars: [],
    dose: "One tablet every 24 hours with or without food.",
    sideEffects:
        "Tiredness, dizziness, depression, shortness of breath, low heart rate, low blood pressure, diarrhea, pruritus.",
    tips: "1. Monitor your blood pressure and heart rate regularly.\n"
        "2. Avoid quickly standing up to prevent a drop in blood pressure.\n"
        "3. A healthy diet, low salt, and exercise can enhance the medication's effectiveness and heart health.\n"
        "4. Diabetes Considerations: it can mask low blood sugar symptoms like shaking or sweating. Monitor your blood sugar level regularly.",
  ),
  MedicineModel(
    id: 5,
    name: "Tritace 5mg",
    image: AppImages.medicine4,
    similars: ["Right-ace 5mg"],
    dose: "One tablet every 24 hours at the same time.",
    sideEffects: "Low blood pressure, cough, dizziness.",
    tips:
        "1. Do not use salt substitutes or supplements containing potassium.\n"
        "2. If you also have diabetes, you may need to monitor your blood sugar levels.\n"
        "3. May cause a fall in blood pressure especially when you rise from a sitting or lying down position.",
  ),
  MedicineModel(
    id: 6,
    name: "Amaryl 2mg",
    image: AppImages.medicine5,
    similars: ["Dolcyl 2mg"],
    dose:
        "One tablet every 24 hours with breakfast or the first main meal of the day.",
    sideEffects:
        "Dizziness, fast heartbeat, skin rash, shortness of breath, and puffiness of the eyelids or around the face, lips, or tongue.",
    tips:
        "1. If you forget to take your daily dose, skip the missed dose and take your next dose at the usual time. Never double doses.\n"
        "2. Taking this medication on an empty stomach may cause excessive lowering of blood sugar levels.",
  ),
  MedicineModel(
    id: 7,
    name: "Galvus Met 50/1000mg",
    image: AppImages.medicine6,
    similars: ["Sugarlo Plus 50/1000mg", "Gliptus Plus 50/1000mg"],
    dose: "One tablet every 12 hours taken with meals.",
    sideEffects: "Dizziness, tremor, nausea, abdominal pain.",
    tips: "1. Galvus Met is indicated as an adjunct to diet and exercise.\n"
        "2. If you miss a dose, take it as soon as you remember. Unless it’s near the next dose, never double doses.\n"
        "3. Store medication in a cool, dry place away from direct sunlight.",
  ),
  MedicineModel(
    id: 8,
    name: "Lantus 100 i.u./ml",
    image: AppImages.medicine7,
    similars: ["Toujeo SoloStar"],
    dose:
        "Type 1 diabetes: Start with approximately one-third to one-half of the total daily insulin requirement.\n"
        "Type 2 diabetes: 10 units once daily or 0.2 units/kg/day.",
    sideEffects: "Hypoglycemia, hypersensitivity reactions, hypokalemia.",
    tips:
        "1. Inject under the skin, using a syringe or insulin pen, once per day at the same time of day.\n"
        "2. Do not inject into the same place two times in a row.\n"
        "3. Avoid injecting into skin that is damaged.",
  ),
  MedicineModel(
    id: 9,
    name: "Mixtard 30",
    image: AppImages.medicine8,
    similars: ["Insulinagypt 70/30", "Humulin 70/30"],
    dose:
        "Between 0.3 and 1.0 international units per kilogram body weight per day given 30 minutes before meals.",
    sideEffects: "None specified in the document.",
    tips: "1. Choose the shortest needle length.\n"
        "2. Wash your hands and clean the injection site.\n"
        "3. Prepare a syringe or injection pen.\n"
        "4. Inject into the fat layer under the skin.\n"
        "5. Dispose of needles safely.",
  ),
  MedicineModel(
    id: 10,
    name: "Synjardy 12.5/1000mg",
    image: AppImages.medicine9,
    similars: ["Mellitofix Met 12.5/1000mg", "Empagliform 12.5/1000mg"],
    dose:
        "For immediate-release tablets, take one tablet every 12 hours with meals.",
    sideEffects:
        "Urinary tract infection, decreased vitamin B12 levels, nausea.",
    tips:
        "1. Check your blood sugar regularly and test for ketones in your urine. Empagliflozin can cause a serious condition called ketoacidosis.\n"
        "2. Your doctor may have you take extra vitamin B12 while you are taking empagliflozin and metformin.\n"
        "3. Take the medicine (with food) as soon as you can, but skip the missed dose if it is almost time for your next dose. Do not take two doses at one time.\n"
        "4. Avoid getting up too fast from a sitting or lying position, or you may feel dizzy.",
  ),
];

final List<MedicineModel> medicinesArabic = [
  MedicineModel(
    id: 1,
    name: "أتاكاند ١٦مجم",
    image: AppImages.medicine0, // Assuming AppImages is defined elsewhere
    similars: ["ألبوستيكس ١٦مجم", "كاندالكان ١٦مجم"],
    dose: "قرص واحد كل ٢٤ ساعة مع أو بدون طعام.",
    sideEffects:
        "صداع، انخفاض ضغط الدم؛ مما قد يجعلك تشعر بالدوار.\nارتفاع مستوى البوتاسيوم بالدم والذي قد يسبب التعب، الضعف، اضطراب ضربات القلب، أو وخزًا.",
    tips:
        "إذا كنت مصابًا بالسكري، لا تتناول أتاكاند مع أي دواء يحتوي على أليسكيرين (دواء لضغط الدم).\nأخبر طبيبك إذا كنت تعاني من مرض الكلى (أو إذا كنت تخضع لغسيل الكلى).",
  ),
  MedicineModel(
    id: 2,
    name: "كونكور ٥ مجم",
    image: AppImages.medicine1,
    similars: ["بيوزكارد ٥مجم", "بيسولوك ٥مجم"],
    dose: "قرص واحد كل ٢٤ ساعة في الصباح مع الماء (دون مضغ) مع الطعام أو بدونه",
    sideEffects:
        "صداع، دوخة، مشاكل في النوم، ألم في المفاصل، إسهال، إمساك، غثيان",
    tips:
        "قم بقياس ضغط دمك بانتظام.\nإذا نسيت جرعة، تناولها فور تذكرها. إذا كان موعد الجرعة التالية قريبًا، تخطَّ الجرعة الفائتة.\nقد يُخفى بعض أعراض انخفاض السكر في الدم، لذا ينبغي على مرضى السكري مراقبة مستوى السكر في الدم بدقة أثناء تناول هذا الدواء",
  ),
  MedicineModel(
    id: 3,
    name: "إيراستابكس ٤٠مجم",
    image: AppImages.medicine2,
    similars: ["نورمسار ٤٠مجم", "انجيوسارتان ٤٠مجم", "ليزبرج ٤٠مجم"],
    dose: "قرص واحد كل ٢٤ ساعة بعد وجبة الإفطار.",
    sideEffects:
        "الدوخة ,الصداع ,التعب ,الغثيان أو القيء ,انخفاض ضغط الدم ,الإسهال ,ألم في الظهر أو المفاصل ,السعال.",
    tips: "يجب شرب كمية وفيرة من الماء لتجنب انخفاض ضغط الدم.",
  ),
  MedicineModel(
    id: 4,
    name: "سيلوكينزوك ٥٠مجم",
    image: AppImages.medicine3,
    similars: [],
    dose: "قرص واحد كل ٢٤ ساعة مع أو بدون طعام.",
    sideEffects:
        "التعب، الدوار، الاكتئاب، ضيق التنفس، انخفاض معدل ضربات القلب، انخفاض ضغط الدم، الإسهال، الحكة.",
    tips:
        "احرص على متابعة ضغط الدم ومعدل ضربات القلب بانتظام.\nاتباع نظام غذائي صحي، وتقليل تناول الملح، والرياضة يمكن أن يعزز فعالية الدواء ويحسن صحة القلب.\nبالنسبة لمرضى السكر: قد يخفي أعراض انخفاض سكر الدم مثل الرجفة أو التعرق. عليهم الحرص على مراقبة مستويات السكر في الدم بانتظام.",
  ),
  MedicineModel(
    id: 5,
    name: "تريتاس ٥مجم",
    image: AppImages.medicine4,
    similars: ["رايت إيس ٥مجم"],
    dose: "قرص واحد كل ٢٤ ساعة فى نفس الميعاد.",
    sideEffects: "انخفاض ضغط الدم ,السعال,الدوار.",
    tips:
        "لا تستخدم  الملح أو المكملات التي تحتوي على البوتاسيوم.\nإذا كنت تعاني من مرض السكري، قد تحتاج إلى مراقبة مستويات السكر في الدم.",
  ),
  MedicineModel(
    id: 6,
    name: "أماريل ٢مجم",
    image: AppImages.medicine5,
    similars: ["دولسيل ٢مجم"],
    dose: "قرص واحد كل ٢٤ ساعة مع وجبة الإفطار أو أول وجبة رئيسية في اليوم.",
    sideEffects:
        "دوار ،سرعة ضربات القلب ،حكة،ضيق في التنفس ،تورم الجفون أو حول العينين الوجه، الشفاه، أو اللسان.",
    tips:
        "إذا نسيت تناول الجرعة اليومية ، تخطَ الجرعة الفائتة تناول الجرعة التالية في الوقت المعتاد.لا تأخذ جرعتين في نفس الوقت لتعويض الجرعة الفائتة.\nتناول هذا الدواء على معدة فارغة قد يؤدي إلى انخفاض مفرط في مستويات السكر في الدم.",
  ),
  MedicineModel(
    id: 7,
    name: "جالفس مت ٥٠/١٠٠٠مجم",
    image: AppImages.medicine6,
    similars: ["شوجارلو بلس ٥٠/١٠٠٠مجم", "جليبتس بلس ٥٠/١٠٠٠مجم"],
    dose: "قرص واحد كل ١٢ ساعة  مع الطعام.",
    sideEffects: "الدوار، الرعشة، الغثيان، آلام في البطن",
    tips:
        "يؤخذ جالفس مت جنباً إلى جنب مع النظام الغذائي وممارسة التمارين الرياضية.\nفي حالة نسيان جرعة، يتم تناولها فور تذكرها إلا إذا كان موعد الجرعة التالية قريبًا، ولا تُضاعف الجرعات أبدًا.\nيُحفظ الدواء في مكان بارد وجاف بعيدًا عن أشعة الشمس المباشرة.",
  ),
  MedicineModel(
    id: 8,
    name: "لانتوس ١٠٠وحدة/ملى",
    image: AppImages.medicine7,
    similars: ["قلم توجو"],
    dose:
        "مريض النوع الأول من السكر: من ثلث إلى نصف جرعة الانسولين اليومي.\nمريض النوع الثاني من السكر: 10 وحدات يوميا.",
    sideEffects: "الحساسية ,انخفاض سكر الدم ،نقص البوتاسيوم بالدم.",
    tips:
        "قم بالحقن تحت الجلد باستخدام حقنة أو قلم الأنسولين مرة واحدة يوميًا في نفس الوقت من اليوم. لا تحقن في نفس المكان مرتين متتاليتين. تجنب الحقن في الجلد المصاب.\nالطريقة الصحيحة لاستخدام قلم الأنسولين",
  ),
  MedicineModel(
    id: 9,
    name: "ميكستارد ٣٠",
    image: AppImages.medicine8,
    similars: ["إنسولينا جيبت٧٠/٣٠", "هومولين٧٠/٣٠"],
    dose:
        "بين 0.3 و 1.0 وحدة دولية لكل كيلوغرام من وزن الجسم يومياً قبل الوجبة ب ٣٠ دقيقة.",
    sideEffects:
        "None specified in the document.", // or leave empty as in the original
    tips:
        "اختيار أقصر طول للإبرة.\nغسل اليدين وتنظيف مكان الحقن.\n تحضير الحقنة أو قلم الحقن.\n الحقن في طبقة الدهون تحت الجلد.\nالتخلص من الإبر بشكل آمن.",
  ),
  MedicineModel(
    id: 10,
    name: "سينجاردي ١٢.٥/١٠٠٠مجم",
    image: AppImages.medicine9,
    similars: ["ميلتوفكس ميت ١٢.٥/١٠٠٠", "إمباجليفيورم١٢.٥/١٠٠٠"],
    dose: "للاقراص الفورية ,تناول قرص واحد كل ١٢ ساعة مع الوجبات.",
    sideEffects: "عدوى المسالك البولية\nانخفاض مستويات فيتامين B12\nالغثيان",
    tips:
        "افحص سكر الدم بانتظام واختبر الكيتونات في البول. يمكن أن يسبب دواء إمباغليفلوزين حالة خطيرة تسمى الحموضة الكيتونية. حتى لو كان سكر الدم طبيعيًا، اتصل بطبيبك إذا أظهر البول مستوى مرتفعًا من الكيتونات.\nقد يوصي طبيبك بتناول فيتامين ب12 إضافي أثناء استخدامك إمباغليفلوزين وميتفورمين. تناول فقط الكمية التي يوصي بها الطبيب\nتناول الدواء (مع الطعام) في أسرع وقت ممكن، ولكن تخطَّ الجرعة الفائتة إذا كان موعد الجرعة التالية قد اقترب. لا تتناول جرعتين في نفس الوقت.\nتجنب النهوض بسرعة من وضعية الجلوس أو الاستلقاء، أو قد تشعر بالدوار",
  ),
];
