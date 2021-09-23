try:
    a=13
    if a<4:
        b=a/(a-3)
    print("b=",b)
except (ZeroDivisionError, NameError):
    print("error occured")
