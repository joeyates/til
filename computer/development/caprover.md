# Setup

Enable ports via firewall

Stop any webserver (e.g. nginx)

On server, run caprover:

docker run -p 80:80 -p 443:443 -p 3000:3000 -v /var/run/docker.sock:/var/run/docker.sock -v /captain:/captain caprover/caprover

Point DNS wildcard at machine

*.example.com.        300     IN      CNAME   foo.example.com.

Locally:

yarn global add caprover

# Deploy

## Dockerfile + GitLab

Under app deployment, choose "Deploy from Github/Bitbucket/Gitlab"

Create deploy key, copy public to GL

Set repo info
Copy deploy private key
Create
Copy webhook to GL

# Comparison with Dokku

CapRover shares services (like database servers) between applications
reducing overhead.

But, if different versions of services are required by different applications,
this advantage disappears.
