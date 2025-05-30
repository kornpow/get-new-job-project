.PHONY: labelprinter resume lnbits pixelpromo webhook coracle bostr homeassistant wordpress-dev wordpress-staging

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

homeassistant:
	helm upgrade --install home-assistant home-assistant/ -f home-assistant/values.yaml

wordpress-dev:
	helm upgrade --install spore-press wordpress/ -f wordpress/values.yaml

wordpress-staging:
	helm upgrade --install -n lnspore \
	wordpress-staging wordpress/ \
	-f wordpress/values.yaml -f wordpress/values-staging.yaml
