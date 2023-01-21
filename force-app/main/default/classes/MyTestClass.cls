public class MyTestClass {
    List<Account> myac = [select ID from Account];
    public list<Account> getmyac(){
    return myac;
    }
}