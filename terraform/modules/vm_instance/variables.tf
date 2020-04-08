variable "name" {

}

variable "zone" {
  default = "europe-west2-c"
}

variable "minecraft-port" {
  default = 25565
}

variable "public_ip" {
  default = ""
}

variable "ssh_user" {
  default = "jayseldelacruz"
}

variable "ssh_pubkey" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDeAFgoFQFg6fNxRY4FPHff5uBLTc89Lci/31ko7BZlbpJD8J9VLS5zcRTUdIRifa4FUO2nALqMoYLA4GX3RCv+gvFJTN+WVkX9eh6Eages8VVGS4eaQ9CIa+Rq0RDaRrA7DoQcS33iys7slrIv2WWw4tHcdEvxCaSJeFl3mObsjwIY18kkdvpsXj2A12Ry8NWb3UeZpLFOioEAvV+9Ns9TlhuI/KtXp9a+FT2r5Vt7l70RDiYae05rhRuXGvQpWODuuV2+Sw1URXahDQxKA3/RNKqIPcHeDFNIC8zF9frXMYzOpTSrFZckjbgsNp3e2tixeSwEfZ9/l3dSl4/JBn7rZpOqUVS2gJxpZJPY5dLGFAc4m3mf0Fh4+9SnowXaUgJTz3Qry/7iiLhShPRTg2r7ofONH6cxtO/dysVANzuRm6KcMrquuZkDJaZ4oKsGI6262xnIuFOEQ/gXAlLhPFhMCUNkzCaDwA+aKnBmJ04wM7C1cxyacD2+M65Zncp3DGqDaafILvzVywgrrpOzWKaK9bRvjhWkWlIRHM+ucRZe8E0sf2KcZgMaa9R7zkj7WZqNIfi7R2NE6gXwrga8mBmbjuzonFhzmErJopTqN1xC8gKQlbi+zR4O/fhkefcSjBZw7TFh//DrXVMRTmPdyu3URZFxA9BIYs/YocagIFnfKQ== jayseldelacruz@UK-C02X521NJG5J"
}

variable "server_jar" {
  default = ""
}
