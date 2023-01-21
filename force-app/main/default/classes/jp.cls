public with sharing class jp {
       public string Username {set;get;}
       public string message {set;get;}
       
       public void ShowMessage() {
           
           message = 'Welcome' + Username;
        }
}