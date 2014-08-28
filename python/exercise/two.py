import one

print(" top level - 0 indentation in two.py")

one.func()

if __name__ == "__main__":
    print(" two is run directly ")
else:
    print(" two is imported in another module ")
