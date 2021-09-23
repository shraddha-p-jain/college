import java.util.Scanner;
class Area_In{
double area;
void circle(double r){
	area=(22*r*r/7);
}
}

class Ar_In extends Area_In{
public static void main(String args[]){
	Scanner s = new Scanner(System.in);
	System.out.println("enter radius:");
	double rad = s.nextDouble();
	Ar_In a = new Ar_In();
	a.circle(rad);
	System.out.println("Area:"+a.area);
}
}