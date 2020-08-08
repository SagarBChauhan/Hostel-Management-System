import java.util.*;
class Student
{
	int rn=101,rtid=2,nob=1;
	String pre="'B-";
	Scanner sc=new Scanner (System.in);
	Student()
	{

	}
}
class Room extends Student
{

	void Display()
	{
		for(int i=101;i<=200;i++)
		{	
			System.out.println("insert into tblRoomMaster values("+i+","+pre+""+rn+"',"+rtid+","+nob+",'Empty');");
			rn++;
			if(rn>125)
				nob=2;
			if(rn>150)
				nob=3;
			if(rn>175)
				nob=4;			
		}
	}
		public static void main(String[] args)
	{
		Room mk=new Room();
		mk.Display();
	}
}
class Result
{

}


