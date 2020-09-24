hcl

path "secret/cookie/*" {
	capabilities = ["create", "read", "delete", "update", "list"]
}

path "secret/cookie/admin" {
	capabilities = ["deny"]
}