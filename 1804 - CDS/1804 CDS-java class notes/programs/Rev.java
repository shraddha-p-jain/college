import java.util.Scanner;
class Rev{
public static void main(String args[]){
Scanner s = new Scanner(System.in);
System.out.print("Enter size of array: ");
int n = s.nextInt();
int m = n;
int a[] = new int[n];
System.out.print("Enter"+n+"elements");
for(int i = 0;i<n;i++)
	a[i]=s.nextInt();
int temp;
for(int i=0;i<n;i++,n--){
temp = a[i];
a[i] = a[n-1];
a[n-1] = temp;
	}
System.out.print("Reverse:");
for(int i = 0;i<m;i++)
System.out.println(a[i]);
	
}
}


import java.util.Scanner;
class Rever
{
	public static void main(String args[])
	{
		Scanner s=new Scanner(System.in);
		int temp,i;
		System.out.print("Enter size of the array:");
		int n=s.nextInt();
		int a[]=new int[n];
		System.out.print("Enter "+n+" elements:");
		for(i=0;i<n;i++)
			a[i]=s.nextInt();
	//	for(i=a.length-1;i>=0;i--)
			System.out.println(a[i]);
}}