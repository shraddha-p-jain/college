import java.util.Scanner;
interface Area_Int{
void circle(double r); //function declaration, prototype,signature
}

class Ar_Int implements Area_Int{
double area;
public void circle(double r){
area = 22*r*r/7;
}
public static void main(String args[]){
	Scanner s = new Scanner(System.in);
	System.out.println("enter radius:");
	double rad = s.nextDouble();
	Ar_Int a = new Ar_Int();
	a.circle(rad);
	System.out.println("Area:"+a.area);
}
}

// mean median, 
//matrix - create inheritance and interfaces.