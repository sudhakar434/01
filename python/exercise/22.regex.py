import re

def main():

    fh = open('story.txt')

    for line in fh:
        match = re.search('that', line)

        if match:
            print match.group()


    fh = open('story.txt')

    for line in fh:
        match = re.search('othe', line)
        if match:
            print match.group()
            print line.replace(match.group(), '*********')


    fh = open('story.txt')
    pattern = re.compile('women')
    for line in fh:
        match = re.search(pattern, line)
        if match:
            print match.group()
            print line.replace(match.group(), '#########')


if __name__ == "__main__":
    main()
