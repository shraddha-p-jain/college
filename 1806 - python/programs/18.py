s = input("Enter a string in which you want to count the vowels: ")

def vow_c(st):
    vow = ["a","i","e","o","u","A","E","I","O","U"]
    num = 0
    for i in st:
        if i in vow:
            num+=1
    return num
print("Number of vowels in given string is:",vow_c(s))
