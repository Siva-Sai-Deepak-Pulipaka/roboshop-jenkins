variable "folders" {
    default = ["Infra", "CI-Pipeline"]
} 
variable "mp-jobs" {
  default = [
    
    { name = "frontend", repo_url = "https://github.com/Siva-Sai-Deepak-Pulipaka/frontend", folder = "CI-Pipeline" },
    { name = "catalogue", repo_url = "https://github.com/Siva-Sai-Deepak-Pulipaka/catalogue", folder = "CI-Pipeline" },
    { name = "cart", repo_url = "https://github.com/Siva-Sai-Deepak-Pulipaka/cart", folder = "CI-Pipeline" },
    { name = "shipping", repo_url = "https://github.com/Siva-Sai-Deepak-Pulipaka/shipping", folder = "CI-Pipeline" },
    { name = "payment", repo_url = "https://github.com/Siva-Sai-Deepak-Pulipaka/payment", folder = "CI-Pipeline" },
    { name = "dispatch", repo_url = "https://github.com/Siva-Sai-Deepak-Pulipaka/dispatch", folder = "CI-Pipeline" },
    { name = "user", repo_url = "https://github.com/Siva-Sai-Deepak-Pulipaka/user", folder = "CI-Pipeline" },
    { name = "aws-ssm-param-store-initcont", repo_url = "https://github.com/Siva-Sai-Deepak-Pulipaka/aws-ssm-param-store-initcont", folder = "CI-Pipeline" }
    ]
}
 
variable "sp-jobs" {
  default = [
    { name = "roboshop", repo_url = "https://github.com/Siva-Sai-Deepak-Pulipaka/roboshop-terraform", folder = "Infra", filename = "Jenkinsfile" },
    { name = "AppDeployment", repo_url = "https://github.com/Siva-Sai-Deepak-Pulipaka/roboshop-ansible", folder = "Infra", filename = "Jenkinsfile-deployment" }
  ]
}

variable "force" {
  default = false
}