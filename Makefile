.PHONE: dev
dev:
	$(MAKE) -j 2 watch-zola watch-css

.PHONY: serve
watch-zola:
	zola serve -p 8080

.PHONY: watch-css
watch-css:
	find css/ | entr $(MAKE) static/styles.css

.PHONY: release
build: static/styles.css
	zola build

static/styles.css: css/styles.css
	mise exec -- lightningcss --minify --targets '>= 0.25%' $^ -o $@

