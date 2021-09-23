import java.util.Scanner;
class Insert_anywhere{
public static void main(String[] args){
int l, ele, pos;
Scanner s = new Scanner(System.in);
System.out.println("Enter array length");
l = s.nextInt();
int a[] = new int[l+1];
System.out.println("Enter elements:");
for (int i=0;i<l;i++)
	a[i]=s.nextInt();
System.out.println("Enter element to insert:");
ele = s.nextInt();
System.out.println("Enter position where you want to insert:");
pos = s.nextInt();

if(pos<=l+1){
for(int i =l;i>=pos-1;i--){
if(i !=pos-1)
	a[i]=a[i-1];
else if(i==pos-1)
	a[i]=ele;
}
for(int i=0;i<=l;i++)
	System.out.print(a[i]+" ");
}
else
System.out.print("cannot insert in position greater than length");
}
}