all: 
	eleventy --config=config.js

serve:
	eleventy --config=config.js --serve

clean:
	rm -r _site