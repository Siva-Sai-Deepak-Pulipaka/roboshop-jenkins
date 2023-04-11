resource "jenkins_folder" "folders" {
  count = length(var.folders)
  name = element(var.folders, count.index)
}

resource "jenkins_job" "job" {
    depends_on = [jenkins_folder.folders]
    
  count    = length(var.jobs)
  name     = lookup(element(var.jobs, count.index), "name", null)
  folder   = "/job/${lookup(element(var.jobs, count.index), "folder", null)}"  #if /job is not mentioned then it everytime getting deleted
  
  
  template = templatefile("${path.module}/singleBranch-pipeline.xml", {
  
  repo_url = lookup(element(var.jobs, count.index), "repo_url", null)
  name     = lookup(element(var.jobs, count.index), "name", null)
  })

# not to bother about any changes in template
lifecycle {
    ignore_changes = [ template ]    
}

}

# creating dns record for jenkins instead of IP address
data "aws_instance" "jenkins" {
  instance_id = "i-0c6f506b036a64020"
}

resource "aws_route53_record" "jenkins" {
  zone_id = "Z017354339FNHXHAHU536"
  name = "jenkins.easydevops.online"
  type = "A"
  ttl = 30
  records = [data.aws_instance.jenkins.public_ip]
}