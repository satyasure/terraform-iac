resource "aws_instance" "instance" {
  for_each      = toset(["ingress-01", "node-01", "node-02", "master-01" ])
  ami           = "ami-0c239ecd40dcc174c"
  instance_type = "t2.micro"

  tags = {
    Name = "${each.key}"
  }
}

resource "local_file" "inventory" {
  content = templatefile("inventory.tmpl", { content = tomap({
    for instance in aws_instance.instance:
      instance.tags.Name => instance.public_dns
    })
  })
  filename = format("%s/%s", abspath(path.root), "inventory.yaml")
}
