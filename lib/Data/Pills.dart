
import '../Database/models/Notify.dart';
import '../Database/models/User.dart';

enum notyficationType { Slight, Normal, Hard }


class Disease {
  Disease({required this.dname});
  String dname;
}

class Pills {
  Pills(
      {required this.user,
      required this.disease,
      required this.from,
      required this.to,
      required this.timeToNotify,
      required this.description,
      this.isDone});

  User user;
  Disease disease;
  DateTime from;
  DateTime to;
  String description;
  Notify timeToNotify;
  bool? isDone = false;
}


