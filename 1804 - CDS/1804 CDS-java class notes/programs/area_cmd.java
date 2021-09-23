class area_cmd{
public static void main(String args[]){
	System.out.print("Enter radius:");
	double r = Double.parseDouble(args[0]);
	double area = (22*r*r)/7;
	System.out.print("area:"+area);
}
}

_________________________________________________________

class area_constr{ //name of file
public static void main(String args[])
{
Scanner sc = new SCanner(System.in);
System.out.print("enter radius:");
double r = sc.nextDouble();
area1 a1 = new area1(r);
System.out.println("area" + a1.a);
}
}

___________________________________________________________
