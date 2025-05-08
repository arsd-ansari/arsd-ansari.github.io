class Recommendation {
  final String? name, source, text;

  Recommendation({this.name, this.source, this.text});
}

final List<Recommendation> demo_recommendations = [
  Recommendation(
      name: "Software Engineer - Flutter",
      source: "Yatra Online Limited",
      text:
          "• Act as Flutter Developer with daily communication with Client and team lead.\n"
          '• Independently developed OBMS Rajasthan Application from scratch, demonstrating strong individual contributions.\n'
          '• Collaborate effectively within a team to deliver high-qualityapplications, strong teamwork and communication skills.\n'
          '• Excellent debugging, problem solving, optimization and testing skills.\n'
          ' • Contributed in improvement of the app performance as well as processes in the squad.\n'
          '• Appreciated for proactiveness and my initiatives, and always been a team player.\n'),
  Recommendation(
    name: "Flutter Developer",
    source: "GreenApex Technolabs",
    text:
        "• Developed Online Booking Management System (OBMS) Rajasthan using Flutter Framework.\n"
        '• Interact with Goverenment Officers on a daily basis to understand their requirements and provide timely updates.\n'
        '• Work as Team Leader, ensuring seamless communication and successful project deliveries.\n'
        '• Excellent debugging, problem solving, optimization and testing skills.\n'
  ),
  Recommendation(
      name: "Flutter Developer",
      source: "DQOT Solutions Pvt. Ltd.",
      text:
          "• Develop multiple applications for Android, iOS and Web platforms using Flutter Framework.\n"
          '• Spearheaded the development of the company’s initial Fantasy Application, integrate multiple features such as a payment gateway and third-party SDKs.\n'
          '• Pioneered the end-to-end development of a new Flutter Application, showcasing expertise in creating responsive UI, API implementation, and overall application development.'),
];
