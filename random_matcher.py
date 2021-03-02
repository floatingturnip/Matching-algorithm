import random
import csv

def open_file(filename = 'names.txt'):

    with open(filename) as f:
        content = f.readlines()
    # removes the "\n"
    content = [x.strip() for x in content]
    return content


def random_match(full_list, n=2):
    print(full_list)
    random.shuffle(full_list)
    print(full_list)

    subgroups = [full_list[i * n:(i + 1) * n] for i in range((len(full_list) + n - 1) // n)]
    print(subgroups)
    return subgroups


def write_groups_to_csv(subgroups):
    with open("out.csv", "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerows(subgroups)


if __name__ == "__main__":
    full_list = open_file()
    subgroups = random_match(full_list)
    write_groups_to_csv(subgroups)