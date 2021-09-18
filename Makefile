CONFIG=config.yml


all:
	nene --config=$(CONFIG)

serve:
	nene --config=$(CONFIG) --serve

clean:
	rm -r _build
