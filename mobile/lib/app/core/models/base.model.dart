abstract class BaseModel {
  fromJson() {}

  toJson() {}

  @override
  String toString() {
    return toJson().toString();
  }
}
