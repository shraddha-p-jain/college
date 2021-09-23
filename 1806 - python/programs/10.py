n = input("Enter a string: ")
rev = n[::-1]
if n==rev:
    print("palindrome")
else:
    print("not palindrome")

## two funtions

def reverse(s):
    return s[::-1]
def palindrome(s):
    rev = reverse(s)
    if s==rev:
        return True
    else:
        return False

a = palindrome(n)
if a:
    print("Yes")
else:
    print("No")
