export PATH := $(PWD)/bin:$(PATH)

# License: BSD3
URL := https://www.eff.org/files/2016/07/18/eff_large_wordlist.txt

wordlist.csv: wordlist.txt
	awk '{print $$2}' $< | python3 ./tag.py > $@

wordlist.txt:
	curl -o $@ $(URL)

clean:
	rm -f wordlist.txt wordlist.csv

bin:
	virtualenv .
	pip install nltk
	python -c 'import nltk; ntlk.download("averaged_perceptron_tagger"); nltk.download("punkt")'

