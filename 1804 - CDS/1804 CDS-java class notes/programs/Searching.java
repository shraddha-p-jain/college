import java.util.Scanner;
class Searching{

static int linear_search(int x, int a[]){
	for(int i =0;i<a.length;i++){
		if(a[i]==x)
			return i+1;
	}
	return -1;
}

static int binary_search(int x, int a[]){
	int n = a.length;
	int i = (int)a.length/2;
	while(i!=0 || i!=n-1){
		if(a[i]==x)
			return i+1;
		else if(a[i]<x){
			i = (int)i+i/2;
			}
		else if(a[i]>x){
			i=(int)i/2;
			}
	}

	return -1;	
}

static int jump_search(int x,int a[]){
	int i = 0;
	int n = a.length;
	int jump = Math.round(Math.sqrt(n))
	while(i<n){
		if(a[i]==x)
			return i+1;
		else if(a[i]<x)
			i = i+Math.round(Math.sqrt(n))
			
	}
}

public static void main(String args[]){
	Scanner s = new Scanner(System.in);
	System.out.println("Enter array length");
	int l = s.nextInt();
	int a[] = new int[l];
	System.out.println("Enter elements:");
	for (int i=0;i<l;i++)
		a[i]=s.nextInt();
	System.out.println("Enter element to search:");
	int x = s.nextInt();
	int ls = linear_search(x,a);
	int bs = binary_search(x,a);
System.out.print(ls+"   "+bs);
}
}