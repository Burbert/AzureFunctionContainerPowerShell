# Azure Function Runtime Container PowerShell
Create an Azure Function App runtime docker container to produce http responses.<br>
Can be used to create test scenarios for instance for WAF testing.
## Create container

```powershell
Set-Location ./function
docker build -t <container registry>/<image name>:<image tag> .
docker push <container registry>/<image name>:<image tag>

docker run -d -p 80:80 <container registry>/<image name>:<image tag>

Invoke-WebRequest -Method Get -uri 'http://localhost/api/testHttpResponse?response_code=201'
```