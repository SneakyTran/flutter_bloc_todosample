enum ViewProjectStatus {
  all("All"),
  todo("To do"),
  inProgress("In progress"),
  done("Done");

  final String name;

  const ViewProjectStatus(this.name);
}

enum ProjectStatusEnum {
  todo("To do"),
  inProgress("In progress"),
  done("Done"),
  created("New");

  final String status;
  const ProjectStatusEnum(this.status);
}
