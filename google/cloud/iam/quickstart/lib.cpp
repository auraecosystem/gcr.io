#include "google/cloud/iam/admin/v1/iam_client.h"
#include "google/cloud/project.h"
#include <iostream>

int main(int argc, char* argv[]) try {
  if (argc != 2) {
    std::cerr << "Usage: " << argv[0] << " <project-id>\n";
    return 1;
  }

  // Create a namespace alias to make the code easier to read.
  namespace iam = ::google::cloud::iam_admin_v1;
  iam::IAMClient client(iam::MakeIAMConnection());
  auto const project = google::cloud::Project(argv[1]);
  std::cout << "Service Accounts for project: " << project.project_id() << "\n";
  int count = 0;
  for (auto sa : client.ListServiceAccounts(project.FullName())) {
    if (!sa) throw std::move(sa).status();
    std::cout << sa->name() << "\n";
    ++count;
  }
  if (count == 0) std::cout << "No Service Accounts found.\n";

  return 0;
} catch (google::cloud::Status const& status) {
  std::cerr << "google::cloud::Status thrown: " << status << "\n";
  return 1;
}
