class bank_account:
    def __init__(self):
        self.balance = 0

    def deposit(self, amount):
        self.balance += amount
        return self.balance

    def withdraw(self, amount):
        self.balance -= amount
        return self.balance


def main():
    a = bank_account()
    b = bank_account()
    print a.deposit(1000)
    a.withdraw(200)
    b.deposit(1)
    b.withdraw(999)

if __name__ == '__main__':
    main()
