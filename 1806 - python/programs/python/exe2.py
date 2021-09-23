def cfloat(li):
    er=0
    for ele in li:
        try:
            x=float(ele)
        except ValueError:
            er+=1
    return er

li=[10,20,10.3,'asd','reyw','wer']
print(cfloat(li))
