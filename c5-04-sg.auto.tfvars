
# Security Group Bastion-Host Variables
sg_bastion_host_ingress_rules = ["ssh-tcp"]
sg_bastion_host_ingress_cidr_blocks = ["0.0.0.0/0"]
sg_bastion_host_egress_rules = ["all-all"]

sg_api_ingress_rules = ["ssh-tcp","http-80-tcp","https-443-tcp"]
sg_api_ingress_cidr_blocks = ["0.0.0.0/0"]
sg_api_egress_rules = ["all-all"]
