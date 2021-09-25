output "server_ip" {
  value = "${aws_instance.poc-vm.public_ip}"
}