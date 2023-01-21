public class TestApex {
	list<Account> acc = [select ID,name from Account where name!=''];
    public list<Account> getacc(){
        return acc;
    }
}