# Arbeidskrav IaC – Modul 8

Repo: https://github.com/chrordal-lang/iac.mod8.final

Jeg har satt opp Infrastructure as Code i Azure ved hjelp av Terraform og GitHub Actions. Målet var å definere infrastrukturen, lagre state trygt, og bruke CI/CD for automatisk utrulling i tre miljøer: dev, test og prod.

# Struktur i prosjektet

.github/workflows

* ci.yaml – kjører sjekk av Terraform-koden på pull requests
* cd.yaml – ruller ut endringer til dev, test og prod når main oppdateres

terraform

* main.tf – provider, backend og ressurser
* variables.tf
* locals.tf
* outputs.tf
* env/dev.tfvars
* env/test.tfvars
* env/prod.tfvars

Backend er konfigurert mot en egen Storage Account i Azure slik at Terraform state lagres sentralt.

# Oppsett i Azure

Disse ressursene ble opprettet på forhånd:

* Resource Group for Terraform-state
* Storage Account med en container for state
* App Registration for GitHub Actions 
* Federated credential som gir GitHub Actions tilgang uten bruk av hemmelige nøkler

Terraform-koden oppretter selve miljøene: en ressursgruppe og en storage-konto per miljø.

# CI-pipeline

Trigger: Pull request mot main.
Den kjører:

* fmt
* validate
* plan for dev, test og prod

Plan-resultatene blir lagt inn som kommentar i pull request. Dette gjør at feil blir oppdaget før merge.

# CD-pipeline

Trigger: Push til main.
Pipelineen har tre steg som kjører i rekkefølge:

1. deploy-dev
2. deploy-test
3. deploy-prod

Hvert steg logger inn via OIDC, initialiserer Terraform og kjører apply med riktig tfvars-fil. Dermed rulles endringene alltid ut i riktig miljørekkefølge.

# Skjermbilder

Følgende skjermbilder er lagt ved i innleveringen:

* Azure-ressurser (state-RG, storage, app registration)
* Repo-struktur i GitHub
* CI-workflow med plan-kjøringer
* CD-workflow der alle tre miljøer er deployet
* Eksempel på PR med plan-kommentar
