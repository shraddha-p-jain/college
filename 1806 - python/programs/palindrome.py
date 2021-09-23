x = input("Enter a string")
def palindrome(s):
    rev = s[::-1]
    if s.lower()==rev.lower():
        return True
    else:
        return False
