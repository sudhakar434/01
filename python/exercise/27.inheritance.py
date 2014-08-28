class bank_account():
    def __init__(self):
        self.balance = 0

    def deposit(self, amount):
        self.balance += amount
        print 'balance %d' % self.balance
        return self.balance

    def withdraw(self, amount):
        self.balance -= amount
        print 'balance %d' % self.balance
        return self.balance

class minimum_balance_account(bank_account):
    def __init__(self, minimum_balance):
        bank_account.__init__(self)
        self.minimum_balance = minimum_balance

    def withdraw(self, amount):
        if self.balance - amount < self.minimum_balance:
            print 'Sorry, minimum balance has to be maintained'
        else:
            bank_account.withdraw(self, amount)


def main():
    a = bank_account()
    a.deposit(1000)
    a.withdraw(200)
    c = minimum_balance_account(500)
    c.withdraw(100)
    c.deposit(222222)
    c.withdraw(100)

if __name__ == '__main__':
    main()
