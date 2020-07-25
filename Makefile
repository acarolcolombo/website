all: 
	eleventy --config=config.js

serve:
	eleventy --serve

clean:
	rm -r _site