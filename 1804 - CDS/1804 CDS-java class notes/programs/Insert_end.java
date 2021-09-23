import java.util.Scanner;
class Insert_end{
public static oid main(String[] args){
int l, ele;
Scanner s = new Scanner(System.in);
System.out.println("Enter array length");
l = s.nextInt();
int a[] = new int[l+1];
System.out.println("Enter elements:");
for (i=0;i<l<i++)
	a[i]=s.nextInt();
System.out.println("Enter element to insert:");
ele = s.nextInt();
a[l]=ele;

for(i=0;i<=1;i++)
	System.out.print(a[i]+" ");
}
}