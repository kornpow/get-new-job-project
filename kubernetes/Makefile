.PHONY: labelprinter resume lnbits pixelpromo webhook coracle bostr

labelprinter:
	helm upgrade --install labelprinter labelprinter/ -f labelprinter/values.yaml

resume:
	helm upgrade --install resume resume/ -f resume/values.yaml

lnbits:
	helm upgrade --install lnbits lnbits/ -f lnbits/values.yaml

pixelpromo:
	helm upgrade --install pixel-promo pixel-promo/ -f pixel-promo/values.yaml

webhook:
	helm upgrade --install webhook webhook/ -f webhook/values.yaml

coracle:
	helm upgrade --install coracle coracle/ -f coracle/values.yaml

bostr:
	helm upgrade --install bostr bostr/ -f bostr/values.yaml