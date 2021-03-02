import random
import csv

def shuffle_list(orig_list):
    randomized_list = orig_list[:]
    while True:
        random.shuffle(randomized_list)
        for a, b in zip(orig_list, randomized_list):
            if a == b:
                break
        else:
            return randomized_list


def get_list():
    filename = 'names.txt'

    with open(filename) as f:
        content = f.readlines()

    orig_names = [x.strip() for x in content]
    return orig_names


def write_to_csv(orig_list, randomized_list):
    with open('some.csv', 'w') as f:
        writer = csv.writer(f)
        writer.writerows(zip(orig_list, randomized_list))

if __name__ == "__main__":
    orig_list = get_list()
    randomized_list = shuffle_list(orig_list)
    write_to_csv(orig_list, randomized_list)
    print(orig_list)
    print(randomized_list)

