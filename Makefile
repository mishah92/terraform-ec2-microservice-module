REV:=$(shell git rev-parse --short HEAD)
DATE:=$(shell date +%Y.%m.%d-%H.%M.%S)
COMMIT:=$(DATE)-$(REV)

# Modules
MODULE:="test"

init:
	terraform init $(MODULE)

validate: init
	terraform validate $(MODULE)

plan: validate
	terraform plan -state=$(MODULE)/terraform.tfstateservice -var 'git_commit=$(COMMIT)' -out=$(COMMIT).tfplan $(MODULE)

apply: plan
	terraform apply -state=$(MODULE)/terraform.tfstate --auto-approve $(COMMIT).tfplan

destroy: validate
	terraform destroy -state=$(MODULE)/terraform.tfstateservice --auto-approve $(MODULE)

clean:
	rm -rf .terraform/ || true
	rm plan.out  || true