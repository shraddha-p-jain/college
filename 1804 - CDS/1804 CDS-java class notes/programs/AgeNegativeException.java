import java.util.Scanner;
class AgeNegativeException extends Exception{
	AgeNegativeException(String str){
		super(str);
	}

public static void main(String args[]){
	Scanner s = new Scanner(System.in);
	System.out.print("Enter Age: ");
	int age = s.nextInt();
	if(age>0){
		System.out.println("Age: "+age);
	}
	else{
		try{
			throw new AgeNegativeException("Age cannot be negative");
		}
		catch(AgeNegativeException ae){
			ae.printStackTrace();
		}
	}
}
}