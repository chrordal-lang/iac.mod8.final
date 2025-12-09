# Dokumentasjon for arbeidskrav – IaC Modul 8

Dette prosjektet setter opp Azure-infrastruktur med Terraform og bruker GitHub Actions både til CI (sjekker på Pull Requests) og CD (automatisk deploy til dev, test og prod). All autentisering skjer via OIDC fra GitHub til Azure.

Repo:
https://github.com/chrordal-lang/iac.mod8.final

# Oppsett i Azure

Følgende ressurser er satt opp manuelt som grunnlag for Terraform:

Resource Group for Terraform state
Storage account med container for Terraform state
Key Vault
App Registration for GitHub Actions (OIDC)
Federated credential mellom GitHub-repoet og Azure

Terraform-koden oppretter selve fag-miljøene:

Ressursgruppe for dev, test og prod
Storage account for dev, test og prod

# Mappestruktur i repoet

.github/workflows/
  ci.yaml
  cd.yaml

terraform/
  main.tf
  variables.tf
  outputs.tf
  locals.tf

terraform/env/
  dev.tfvars
  test.tfvars
  prod.tfvars

ci.yaml kjører fmt, validate og plan på Pull Requests
cd.yaml deployer automatisk til dev → test → prod når main oppdateres

# CI-workflow

Når en Pull Request opprettes eller oppdateres:

GitHub Actions logger inn i Azure via OIDC
Terraform fmt og validate kjøres
Terraform plan kjøres for dev, test og prod
Resultatet legges som kommentar i Pull Request slik at man kan se endringene før merge

Skjermbilder ligger under.

CD-workflow

Når PR merges til main:

1. dev-miljø deployes
2. test-miljø deployes
3. prod-miljø deployes

Alle tre ble kjørt vellykket i dette prosjektet.

# Skjermbilder i mappen /images

