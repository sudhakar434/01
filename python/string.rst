
    s = 'a.b'   # strip punctuation from string
    s.translate(string.maketrans("",""), string.punctuation)

    regex = re.compile('[%s]'.format(re.escape(string.punctuation)))
    regex.sub('', s)

    ''.join(i for i in s if i not in set(string.punctuation))

    for c in string.punctuation:
