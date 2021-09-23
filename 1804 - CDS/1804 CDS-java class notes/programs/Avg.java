// basic
import java.util.Scanner;
class Avg{
public static void main(String args[]){
int n;
double av=0;
Scanner s = new Scanner(System.in);
System.out.print("How many numbers do you want to enter?");
n = s.nextInt;
int arr[] = new int[n];
for(int i=0;i<n;i++){
	arr[i]=s.nextInt();
	}
}
}

//cmd

class Avg{
public static void main(String args[]){
int n;
double av=0;
n=args.length;
for(int i=0;i<n;i++){
	sum+=Integer.parseInt(args[i]);
	}
System.out.print("Average of (");
for(int i=0;i<n;i++){
	System.out.print(args[i])
	if(i!=n-1)
	System.out.print(", ");
	}
System.out.print(") Average:"+sum/n)

}
}

// constructor - separate classes

import java.util.Scanner;
class Avg_cons{
long sum = 0
Avg_cond(int a[], int n){
for(int i=0;i<n;i++)
	sum+=a[i];
}
}
class Avg{
public static void main(String args[]){
int n;
double av=0;
Scanner s = new Scanner(System.in);
System.out.print("How many numbers do you want to enter?");
n = s.nextInt;
int arr[] = new int[n];
for(int i=0;i<n;i++){
	arr[i]=s.nextInt();
	}
Avg_cons avg = new Avg_cons(arr,n);
System.out.print(avg.sum/n)

}
}


//using method


