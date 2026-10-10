public class Audit extends BankAccount
{
   private int depositCount;
   private int withdrawCount;
   
   public Audit(){
       depositCount=0;
       withdrawCount=0;
   }
   
   @Override
   public void deposit(int amount){
       super.deposit(amount);
       this.depositCount++;
       
   }
   
   @Override
   public void withdraw(int amount){
       super.withdraw(amount);
       this.withdrawCount++;
   }
   
   @Override
   public String toString(){
        return "depositCount = "+depositCount+"\nwithdrawCount = "+withdrawCount;
   }
}