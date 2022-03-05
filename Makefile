format:
	swift format \
		--in-place \
		--recursive \
		--ignore-unparsable-files \
		./Package.swift Sources/ Tests/
create-api:
	create-api \
		generate openapi.yaml \
		--output Sources/GoTrueHTTP \
		--module GoTrueHTTP
	$(MAKE) format

.PHONY: format create-api
