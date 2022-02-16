# List to List
locals {
    list = ["hello","terraform","training!"]
}

output "List_to_List" {
    value = [for word in local.list : upper(word)]
}

# List to Map
output "List_to_Map" {
    value = {for word in local.list : word => word}
}

# Map to List
locals {
    valuepairs = { a = 1, 
                   b = 2, 
                   c = 3,
                   d = 4,
                   e = 5}
}

output "Map_to_List_Variant_1" {
    value = [for key in local.valuepairs : key]
}

output "Map_to_List_Variant_2" {
    value = [for key,value in local.valuepairs : "${key} = ${value}"]
}

# Map to Map
output "Map_to_Map" {
    value = {for key,value in local.valuepairs : key => value}
}
