class PatientLog {
  double height;
  double weight;
  double arm;
  double abdominal;
  double hip;
  double imc;
  double tmb;
  DateTime date;

  PatientLog(
      {required this.height,
      required this.weight,
      required this.arm,
      required this.abdominal,
      required this.hip,
      required this.imc,
      required this.tmb,
      required this.date});
}

List<PatientLog> patientLogs = [
  PatientLog(
      height: 170,
      weight: 96,
      arm: 20,
      abdominal: 70,
      hip: 20,
      imc: 31.2,
      tmb: 2234,
      date: DateTime.now()),
  PatientLog(
      height: 170,
      weight: 92,
      arm: 20,
      abdominal: 70,
      hip: 20,
      imc: 30.9,
      tmb: 2134,
      date: DateTime.now()),
  PatientLog(
      height: 170,
      weight: 90,
      arm: 20,
      abdominal: 70,
      hip: 20,
      imc: 30.5,
      tmb: 2234,
      date: DateTime.now()),
  PatientLog(
      height: 170,
      weight: 89,
      arm: 20,
      abdominal: 70,
      hip: 20,
      imc: 30.3,
      tmb: 2134,
      date: DateTime.now()),
  PatientLog(
      height: 170,
      weight: 87,
      arm: 20,
      abdominal: 70,
      hip: 20,
      imc: 29.9,
      tmb: 2134,
      date: DateTime.now()),
  PatientLog(
      height: 170,
      weight: 85,
      arm: 20,
      abdominal: 70,
      hip: 20,
      imc: 29.7,
      tmb: 2234,
      date: DateTime.now())
];
