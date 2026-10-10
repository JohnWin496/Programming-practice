public class BankAccount {
	protected int balance;
	
	public BankAccount() {
		balance=100;
	}
	
	public void deposit(int amount) {
		balance+=amount;
	}
	
	public void withdraw(int amount) {
		balance-=amount;
	}
	
	
}
