all : FAQ.html

%.html : %.markdown
	pandoc --from=markdown --to=html \
		--standalone \
		--css=nominolo.css \
		--output=$@ $<
