class Paciente {
  String name;
  String photo;
  String diagnosis;
  double progress;
  String status;
  String enfermedad;
  Map statusDay;

  Paciente(
      {required this.name,
      required this.photo,
      required this.diagnosis,
      required this.progress,
      required this.status,
      required this.enfermedad,
      required this.statusDay});
}

List<Paciente> pacientes = [
  Paciente(
      name: "Rodrigo Morales",
      photo:
          "https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y&s=128",
      diagnosis: "Paciente diabético",
      progress: 0.70,
      status: "Al día",
      enfermedad: "Diabetes y obeso",
      statusDay: {
        "Lu": 1,
        "Ma": 1,
        "Mi": 1,
        "Ju": 1,
        "Vi": 0,
        "Sa": 0,
        "Do": 0
      }),
  Paciente(
      name: "Rodrigo Morales",
      photo:
          "https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y&s=128",
      diagnosis: "Paciente diabético",
      progress: 0.70,
      status: "Pendiente",
      enfermedad: "Obesidad grave",
      statusDay: {
        "Lu": 1,
        "Ma": 1,
        "Mi": 1,
        "Ju": 1,
        "Vi": 1,
        "Sa": 0,
        "Do": 0
      }),
  Paciente(
      name: "Rodrigo Morales",
      photo:
          "https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y&s=128",
      diagnosis: "Paciente diabético",
      progress: 0.70,
      status: "Al día",
      enfermedad: "Hipertensión",
      statusDay: {
        "Lu": 1,
        "Ma": 1,
        "Mi": 1,
        "Ju": 1,
        "Vi": 0,
        "Sa": 0,
        "Do": 0
      }),
  Paciente(
      name: "Rodrigo Morales",
      photo:
          "https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y&s=128",
      diagnosis: "Paciente diabético",
      progress: 0.70,
      status: "Al día",
      enfermedad: "Diabetes y obeso",
      statusDay: {
        "Lu": 1,
        "Ma": 1,
        "Mi": 1,
        "Ju": 1,
        "Vi": 1,
        "Sa": 0,
        "Do": 0
      }),
  Paciente(
      name: "Rodrigo Morales",
      photo:
          "https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y&s=128",
      diagnosis: "Paciente diabético",
      progress: 0.70,
      status: "Al día",
      enfermedad: "Diabetes y obeso",
      statusDay: {
        "Lu": 1,
        "Ma": 1,
        "Mi": 0,
        "Ju": 0,
        "Vi": 0,
        "Sa": 0,
        "Do": 0
      }),
  Paciente(
      name: "Rodrigo Morales",
      photo:
          "https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y&s=128",
      diagnosis: "Paciente diabético",
      progress: 0.70,
      status: "Al día",
      enfermedad: "Hipertensión",
      statusDay: {
        "Lu": 1,
        "Ma": 1,
        "Mi": 1,
        "Ju": 1,
        "Vi": 0,
        "Sa": 0,
        "Do": 0
      }),
  Paciente(
      name: "Rodrigo Morales",
      photo:
          "https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y&s=128",
      diagnosis: "Paciente diabético",
      progress: 0.70,
      status: "Al día",
      enfermedad: "Hipertensión",
      statusDay: {
        "Lu": 1,
        "Ma": 1,
        "Mi": 1,
        "Ju": 1,
        "Vi": 0,
        "Sa": 0,
        "Do": 0
      }),
  Paciente(
      name: "Rodrigo Morales",
      photo:
          "https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y&s=128",
      diagnosis: "Paciente diabético",
      progress: 0.70,
      status: "Al día",
      enfermedad: "Hipertensión",
      statusDay: {
        "Lu": 1,
        "Ma": 1,
        "Mi": 1,
        "Ju": 1,
        "Vi": 0,
        "Sa": 0,
        "Do": 0
      })
];
