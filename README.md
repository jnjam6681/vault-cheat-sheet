## Vault Secret Management
---

#### Set vault environment
```
export VAULT_ADDR=http://127.0.0.1:8200
export VAULT_TOKEN=""
```

#### Initial vault
```
vault operator init
```

output:
```
Unseal Key 1: PwCOlgKTE5BompUa/1S29tRp513sbj/P+fNe5LFOEHQw
Unseal Key 2: y8xscG3ZVN2pMsNpAwecL3oa55GGhzcFX+3pNtm70nzL
Unseal Key 3: D4klQ+Hdu2uNlkxuAd6/hGsZC9tkV78eMKLeXw+nBa9k
Unseal Key 4: xxGL5sE+ZW4X7/ob7kA+WHPqFT0JH/KQAWXiC1Fr+Iw9
Unseal Key 5: VFVGBwcDrwPMr4uRG+RHHrtaHKlNhUrx+Wf2lfSUlrug

Initial Root Token: s.bQ51ilRZS6BOo3KrUcA3oxS3
```

#### Select master key to unseal
```
vault operator unseal <token>
```

#### Check status vault
vault status

#### Login
```
vault login <token>
```

#### Create Secret Engine
```
vault secrets enable -version=2 -path=secret kv
```

#### Basic Commands
|                           commands                         | desrciption
------------------------------------------------------------ | ------------------
vault server -dev                                            | start server with dev mode
vault path-help                                              | get api path
vault kv put secret/cookie recipe=sugar                      | create secret
vault kv get secret/cookie                                   | list all secret
vault kv get --format=json secret/cookie                     | list secret in JSON format
vault kv get -field=recipe secret/cookie                     | get value by field
vault kv metadata get secret/cookie                          | list metadata from secret
vault kv get -version=1 secret/cookie                        | list secret by version
vault kv patch secret/cookie recipe=nice                     | update secret
vault kv delete secret/cookie                                | delete secret
vault auth enable userpass                                   | enable auth user/password
vault auth list                                              | check auth method
vault write auth/userpass/users/usr password=pwd             | create new user/password
vault login -method=userpass username=usr password=pwd       | login userpass auth method
vault delete auth/userpass/users/usr                         | delete user/password
vault policy list                                            | get all policy          
vault policy write dev_policy path/to/policy.hcl             | create policy from hcl
vault token create -policy=dev_policy                        | create token and grant permission
vault token create -policy=development -display-name=hi      | create token and set name
vault token renew xxx-xxx-xxx                                | renew token
vault token revoke -accessor xxx-xxx-xxx                     | revoke access token
vault list /auth/token/accessors                             | list all token
vault token lookup -accessor xxx-xxx-xxx                     | get detail access token
vault kv get -wrap-ttl=1h secret/mysecret                    | wrapping responses
