/**
 * # ![AWS](aws-logo.png) VPC Endpoints
 *
 * ![AWS VPC Endpoints](aws_vpc_endpoints.png)
 */
data "aws_vpc" "vpc" {
  default = var.vpc == null
  dynamic filter {
    for_each = var.vpc != null ? [1] : []
    content {
      name   = "tag:Name"
      values = [var.vpc]
    }
  }
}

resource "aws_vpc_endpoint" "endpoint" {
  count               = length(var.endpoints)
  service_name        = local.endpoints[var.endpoints[count.index]]
  vpc_id              = data.aws_vpc.vpc.id
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  security_group_ids  = []
}
