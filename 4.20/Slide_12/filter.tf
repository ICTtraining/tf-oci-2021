locals {
    list = ["hello","my","terraform","training!"]
}

output "my_greeting" {
       value = [for word in local.list : upper(word) if word != "my"]
}

variable "mylist1" {
    type = list(string)
    default = ["hello","terraform", "training"]
}

variable "mylist2" {
    type = list(string)
    default = ["how", "are","you?"]
}

locals {
    full_greeting = concat(var.mylist1,var.mylist2)
}

output "my_greeting_2" {
       value = local.full_greeting
}