#! usr/bin/ppython

def repeat(string, exclaim):
    # Returns string thrice, adds exclaimation if it is true

    result = string * 3
    if exclaim:
        result = result + '!!!'

    return result

def main():
    print repeat('python ', True)
    print repeat('programming ', False)

if __name__ == "__main__":
    main()
