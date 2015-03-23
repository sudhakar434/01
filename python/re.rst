re
--


pattern = re.complie(r'\s+')   # strip all whitespaces
pattern.sub('', ' \t foo \n bar \n ')

