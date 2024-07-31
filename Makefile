.PHONY: dev
dev:
	zola serve -p 8080

.PHONY: release
release:
	zola build

