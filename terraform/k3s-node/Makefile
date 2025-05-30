.PHONY: init plan apply

init:
	tofu init -reconfigure

plan:
	tofu plan -var-file=app.tfvars

apply:
	tofu apply -var-file=app.tfvars
