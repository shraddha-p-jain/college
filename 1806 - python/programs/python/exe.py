a=[1,2,3]
try:
    print("second :", a[1])
    print("fourth:", a[3])
except IndexError:
    print("an error")
