import java.util.Scanner;
class fib{
public static void main(String args[]){
	int a;
	Scanner s = new Scanner(System.in);
	int n = s.nextInt();
	int b=1, c=0;
	while(c<=n){
		System.out.print(c+" ");
		a=b;
		b=c;
		c=a+b;
	}
}
}