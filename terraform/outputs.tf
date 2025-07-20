output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.jenkins_k8s_node.id
}

output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.jenkins_k8s_node.public_ip
}

output "public_dns" {
  description = "Public DNS of the EC2 instance"
  value       = aws_instance.jenkins_k8s_node.public_dns
}
