class Education {
  final String name;
  final String score;
  final String clas;
  final String branch;
  final String year;

const  Education(
      {required this.name,
      required this.score,
      required this.clas,
      required this.branch,
      required this.year});
}

class PersonalDetails{
  final String name = "Kode Sai Ratnakar";

  final String fatherName = "Kode Vara Prasad";
  final String motherName = "Kode Vijaya Padma";
  final String sister  = "Kode Bhargavi";
  final String dob = "13-January-2000";
  final String bloodGroup = "B-Positive";
 final String address = "24-527, Balaji Nagar, Velpuru, Tanuku Mandal, WestGodavar, AP, Pin: 534222";
  final String nationaliy = "Indian";
}
class Details {
  Map<String, dynamic> details = {
    "Skills": ["Flutter", "Python", "HTML", "JavaScript", "AWS"],
    "Projects": [
      "Village Interest Manager and Calulator",
      "Brave Rewards Colletor",
      "Btech Final Year Projext"
    ],
    "Education": const [
      Education(
          name: "Bhashyam High School",
          score: "9.8 GPA",
          clas: "10th Class",
          branch: "SSC",
      year: "2015-2016"),

      Education(
          name: "S.M.V.M Polytechnic College",
          score: "87 %",
          clas: "Diploma",
          branch: "Mechanical Engineering",
      year: "2016-2019"
      ),
      Education(
          name: "Sri Vasavi Engineering College",
          score: "7.4 GPA",
          clas: "B.Tech",
          branch: "Mechanical Engieering",
      year: "2019-2022"
      )
    ],
  };
}

