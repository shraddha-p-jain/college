/*
class Except{
public static void main(String args[]){
	System.out.println("Start of");
	try{
	String str = args[0];
	}
	catch(ArrayIndexOutOfBoundsException ae){
	System.out.println("plz enter atleast 1 cmd arg");
	}
	System.out.print("end");
}
}
*/
class Except{
public static void main(String args[]){
	System.out.println("Start of");
	try{
	String str = args[0];
	int i = Integer.parseInt(str);
	int result = i/(i-3);
	}
	catch(ArrayIndexOutOfBoundsException ae){
	System.out.println("plz enter atleast 1 cmd arg");
	}
	catch(NumberFormatException ne){
	System.out.println("Enter numeric values");
	}
	catch(ArithmeticException ar){
	System.out.println("enter a number not 3");
	}
	System.out.print("end");
}
}