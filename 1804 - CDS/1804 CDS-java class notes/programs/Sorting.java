import java.util.Scanner;
class Sorting{

public static int[] bubble_sort(int[] a){
	int n = a.length;
	int n1 = a.length;
	int flag = 0;
	int temp=0;
	for(int i=0;i<n-1;i++){
		flag = 0;
		for(int j = 0;j<n-1-i;j++){
			if(a[j]>a[j+1]){
				temp = a[j];
				a[j]=a[j+1];
				a[j+1]=temp;
				flag++;
				}		
		}
		n1--;
		if(flag==0)
			break;
	}
	
return a;

}

public static int[] selection_sort(int[] a){
	int n = a.length;
	int min = a[0];
	int pos=0;
	for(int i=0;i<n-1;i++){
		min = a[i];
		pos = i;
		for(int j=i;j<n;j++){
			if(min>a[j]){
				min=a[j];
				pos = j;
			}
		}
		if(pos!=i){
			a[pos]=a[i];
			a[i]=min;
		}
	}
	return a;
}

public static int[] insertion_sort(int a[]){
	int n = a.length;
	int temp = 0;
	int flag =0;
	for(int i=1;i<n;i++){
		for(int j=i;j>0;j--){
			if(a[j]<a[j-1]){
				temp = a[j];
				a[j]=a[j-1];
				a[j-1]=temp;
			}
			else
				break;
		}
	}
	return a;
}

public static int[] merge_sort(int a){

}

public static void main(String args[]){
	Scanner s = new Scanner(System.in);
	System.out.println("Enter array length");
	int l = s.nextInt();
	int a[] = new int[l];
	System.out.println("Enter elements:");
	for (int i=0;i<l;i++)
		a[i]=s.nextInt();
	int c[] = bubble_sort(a);
	for(int i=0;i<a.length;i++)
		System.out.println(c[i]);
	int d[] = selection_sort(a);
	for(int i=0;i<a.length;i++)
		System.out.println(d[i]);	
	int e[] = insertion_sort(a);
	for(int i=0;i<a.length;i++)
		System.out.println(e[i]);
}

}