import random
import csv

filename = 'names.txt'

with open(filename) as f:
    content = f.readlines()
# removes the "\n"
content = [x.strip() for x in content]
print(content)
random.shuffle(content)
print(content)

n = 2
subgroups = [content[i * n:(i + 1) * n] for i in range((len(content) + n - 1) // n)]
print(subgroups)

with open("out.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerows(subgroups)