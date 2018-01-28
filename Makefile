export PATH := $(PWD)/bin:$(PATH)

# License: BSD3
URL := https://raw.githubusercontent.com/trezor/python-mnemonic/master/mnemonic/wordlist/english.txt

wordlist.csv: wordlist.txt
	python3 ./tag.py < $< > $@

wordlist.txt:
	curl -o $@ $(URL)

clean:
	rm -f wordlist.txt wordlist.csv

bin:
	virtualenv .
	pip install nltk
	python -c 'import nltk; ntlk.download("averaged_perceptron_tagger"); nltk.download("punkt")'

