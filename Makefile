all: 
	eleventy

serve:
	eleventy --serve

clean:
	rm -r _site