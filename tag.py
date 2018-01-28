import csv
import sys

import nltk

words = sys.stdin.read()
tagged = [nltk.tag.pos_tag([x]) for x in words.split()]

writer = csv.writer(sys.stdout)
for [(word, pos)] in tagged:
    writer.writerow([word, pos])

