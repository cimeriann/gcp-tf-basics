variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
  default     = "qwiklabs-gcp-00-d7f1b3084fbc"

}

variable "name" {
  description = "Name of the buckets to create."
  type        = string
  default     = "sinisbucket03"
}