resource "local_file" "pet" {
  filename = each.value
  for_each = var.filename
  content = "AABB"
}

variable "filename" {
  type=set(string)
  default = [
    "/root/pets.txt",
    "/root/dogs.txt",
    "/root/cats.txt"
  ]
}

output "pets" {
  value = local_file.pet
  sensitive = true
}