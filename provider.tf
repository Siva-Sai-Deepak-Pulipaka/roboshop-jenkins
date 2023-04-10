terraform {
  required_providers {
    jenkins = {
        source = "registry.terraform.io/taiidani/jenkins"
    }
  }
}



provider "jenkins" {
  server_url = "http://172.31.10.122:8080" # Or use JENKINS_URL env var
  username   = data.aws_ssm_parameter.jenkins_user.value            # Or use JENKINS_USERNAME env var
  password   = data.aws_ssm_parameter.jenkins_pass.value            # Or use JENKINS_PASSWORD env var
}


data "aws_ssm_parameter" "jenkins_user" {
  name = jenkins.user
}
data "aws_ssm_parameter" "jenkins_pass" {
  name  = jenkins.pass
}