

resource "github_repository" "terraform-first-repo" {
  name       = "temp-repository-fromterraform"
  description = "My first repo terraform"
  visibility = "public"
  auto_init = true
}

resource "github_repository" "terraform-second-repo" {
  name       = "temp-repository-fromterraform2"
  description = "My first repo terraform"
  visibility = "public"
  auto_init = true
}



resource "github_repository" "PVZ" {
  name        = "PVZ"
  description = "My awesome web page"
  auto_init = true
  visibility = "public"

  pages {
    source {
      branch = "main"
      path   = "/.terraform"
    }
  }
}


//To destroy
// 1. Terraform destroy
// 2. Terraform destroy --target github_repository.terraform-second-repo