variable "table_name" {
  type = string
}

variable "hash_key" {
  type = string
}

variable "hash_key_type" {
  type = string
}

variable "global_secondary_indexes" {

  description = "Optional Global Secondary Indexes"

  type = list(object({

    name            = string
    hash_key        = string
    hash_key_type   = string
    projection_type = string

  }))

  default = []

}