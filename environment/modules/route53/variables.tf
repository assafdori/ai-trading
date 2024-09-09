variable "zones" {
  description = "Map of hosted zones"
  type = map(object({
    comment = string
    tags    = optional(map(string))
  }))

  default = {
    "assaf-trading.com" = {
      comment = "assaf-trading.com (production zone)"
      tags = {
        env = "production"
      }
    }
  }
}


variable "tags" {
  description = "Tags to associate with resources"
  type        = map(string)
  default     = {}
}

variable "zone_name" {
  description = "Name of the Route 53 zone"
  type        = string
  default = "assaf-trading.com"
}

variable "records" {
  description = "List of DNS records for the zone"
  type = list(object({
    name = string
    type = string
    ttl  = optional(number)
    alias = optional(object({
      name    = string
      zone_id = string
    }))
    records = optional(list(string))
  }))
  default = [ {
    name = "www"
    type = "A"
    alias = {
      name    = "d1234567890.cloudfront.net"
      zone_id = "Z12ABCDEFGHIJKL"
    }
  } ]
}

########### VARIABLE RECORDS ARE PLACEHOLDER, NEEDS TO REPLACE, I THINK I WILL NEED BOTH CNAME AND A RECORDS ###########