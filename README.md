# gcp-app
## Generate credentials.json using gcloud and terraform-google-project-factory
```shell script
gcloud auth login admin@[YOUR_GITHUB_ACCOUNT_ID].github.io
gcloud organizations list
gcloud organizations add-iam-policy-binding [YOUR_ORGANISATION_ID] \
--member=user:admin@pivopil.github.io \
--role=roles/resourcemanager.folderAdmin
gcloud alpha resource-manager folders create --display-name=gcp_training_root --organization [YOUR_ORGANISATION_ID]
gcloud projects create [YOUR_SEED_PROJECT_NAME] --folder=[YOUR_ROOT_FOLDER_ID]
gcloud config set project [YOUR_SEED_PROJECT_NAME]
gcloud alpha billing accounts list

git clone https://github.com/terraform-google-modules/terraform-google-project-factory
cd terraform-google-project-factory/helpers

setup-sa.sh -o [YOUR_ORGANISATION_ID] -p [YOUR_SEED_PROJECT_NAME] -b [YOUR_BILLING_ACCOUNT_ID] -f [YOUR_ROOT_FOLDER_ID]
```

## Install the app
```shell script
export TF_ADMIN=[YOUR_SEED_PROJECT_NAME]
export TF_VAR_region=us-west1
export TF_VAR_admin_project=${TF_ADMIN}
export TF_VAR_domain=[YOUR_GITHUB_ACCOUNT_ID].github.io
export TF_VAR_billing_account_id=[YOUR_BILLING_ACCOUNT_ID]
export TF_VAR_folder_id=[YOUR_ROOT_FOLDER_ID]
export TF_VAR_org_id=[YOUR_ORGANISATION_ID]
export GOOGLE_PROJECT=${TF_ADMIN}
export GOOGLE_CLOUD_KEYFILE_JSON=credentials.json
terraform init
terraform plan
terraform apply -auto-approve
```

##  Destroy the app
```shell script
terraform destroy -auto-approve
```

