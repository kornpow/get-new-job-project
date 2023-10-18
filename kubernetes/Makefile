.PHONY: labelprinter resume

labelprinter:
	helm upgrade --install labelprinter labelprinter/ -f labelprinter/values.yaml

resume:
	helm upgrade --install resume resume/ -f resume/values.yaml

lnbits:
	helm upgrade --install lnbits lnbits/ -f lnbits/values.yaml
