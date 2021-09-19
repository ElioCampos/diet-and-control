class Paciente{
  String name;
  String photo;
  String diagnosis;
  double progress;
  String status;
  String enfermedad;
  Map statusDay;

  Paciente({
    required this.name,
    required this.photo,
    required this.diagnosis,
    required this.progress,
    required this.status,
    required this.enfermedad,
    required this.statusDay
  });
}

List<Paciente> pacientes = [
  Paciente(
    name: "Rodrigo Morales",
    photo: "https://static-cdn.jtvnw.net/jtv_user_pictures/986abe5c-d7ee-4f2b-818f-a5a421e481f2-profile_image-300x300.png",
    diagnosis: "Paciente diabético",
    progress: 0.70,
    status: "Al día",
    enfermedad: "Diabetes y obeso",
    statusDay: {"Lu": 1, "Ma": 1, "Mi": 1, "Ju": 1, "Vi": 0, "Sa": 0, "Do": 0}
  ),
  Paciente(
    name: "Rodrigo Morales",
    photo: "https://static-cdn.jtvnw.net/jtv_user_pictures/986abe5c-d7ee-4f2b-818f-a5a421e481f2-profile_image-300x300.png",
    diagnosis: "Paciente diabético",
    progress: 0.70,
    status: "Pendiente",
    enfermedad: "Obesidad grave",
    statusDay: {"Lu": 1, "Ma": 1, "Mi": 1, "Ju": 1, "Vi": 1, "Sa": 0, "Do": 0}
  ),
  Paciente(
    name: "Rodrigo Morales",
    photo: "https://static-cdn.jtvnw.net/jtv_user_pictures/986abe5c-d7ee-4f2b-818f-a5a421e481f2-profile_image-300x300.png",
    diagnosis: "Paciente diabético",
    progress: 0.70,
    status: "Al día",
    enfermedad: "Hipertensión",
    statusDay: {"Lu": 1, "Ma": 1, "Mi": 1, "Ju": 1, "Vi": 0, "Sa": 0, "Do": 0}
  ),
  Paciente(
    name: "Rodrigo Morales",
    photo: "https://static-cdn.jtvnw.net/jtv_user_pictures/986abe5c-d7ee-4f2b-818f-a5a421e481f2-profile_image-300x300.png",
    diagnosis: "Paciente diabético",
    progress: 0.70,
    status: "Al día",
    enfermedad: "Diabetes y obeso",
    statusDay: {"Lu": 1, "Ma": 1, "Mi": 1, "Ju": 1, "Vi": 1, "Sa": 0, "Do": 0}
  ),
  Paciente(
    name: "Rodrigo Morales",
    photo: "https://static-cdn.jtvnw.net/jtv_user_pictures/986abe5c-d7ee-4f2b-818f-a5a421e481f2-profile_image-300x300.png",
    diagnosis: "Paciente diabético",
    progress: 0.70,
    status: "Al día",
    enfermedad: "Diabetes y obeso",
    statusDay: {"Lu": 1, "Ma": 1, "Mi": 0, "Ju": 0, "Vi": 0, "Sa": 0, "Do": 0}
  ),
  Paciente(
    name: "Rodrigo Morales",
    photo: "https://static-cdn.jtvnw.net/jtv_user_pictures/986abe5c-d7ee-4f2b-818f-a5a421e481f2-profile_image-300x300.png",
    diagnosis: "Paciente diabético",
    progress: 0.70,
    status: "Al día",
    enfermedad: "Hipertensión",
    statusDay: {"Lu": 1, "Ma": 1, "Mi": 1, "Ju": 1, "Vi": 0, "Sa": 0, "Do": 0}
  ),
  Paciente(
    name: "Rodrigo Morales",
    photo: "https://static-cdn.jtvnw.net/jtv_user_pictures/986abe5c-d7ee-4f2b-818f-a5a421e481f2-profile_image-300x300.png",
    diagnosis: "Paciente diabético",
    progress: 0.70,
    status: "Al día",
    enfermedad: "Hipertensión",
    statusDay: {"Lu": 1, "Ma": 1, "Mi": 1, "Ju": 1, "Vi": 0, "Sa": 0, "Do": 0}
  ),
  Paciente(
    name: "Rodrigo Morales",
    photo: "https://static-cdn.jtvnw.net/jtv_user_pictures/986abe5c-d7ee-4f2b-818f-a5a421e481f2-profile_image-300x300.png",
    diagnosis: "Paciente diabético",
    progress: 0.70,
    status: "Al día",
    enfermedad: "Hipertensión",
    statusDay: {"Lu": 1, "Ma": 1, "Mi": 1, "Ju": 1, "Vi": 0, "Sa": 0, "Do": 0}
  )
];