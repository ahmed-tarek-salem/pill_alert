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
    similars: ["albustix 16mg", "candalkan16mg"],
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
