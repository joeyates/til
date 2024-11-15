# Check the syntax

```sh
terraform validate
```

# Plan

```sh
terraform plan
```

# Apply

```sh
terraform apply
```

Apply without confirmation

```sh
terraform apply -auto-approve
```

# Remove a resource

```sh
terraform state list
terraform state rm <name>
```

# Remove all resources

```sh
terraform destroy
```

DANGER! Destroy without confirmation

```sh
terraform apply -destroy -auto-approve
```

# Cookbook

## Use Terrafrom with AWS

```sh
export AWS_ACCESS_KEY_ID="anaccesskey"
export AWS_SECRET_ACCESS_KEY="asecretkey"

terraform init
```
