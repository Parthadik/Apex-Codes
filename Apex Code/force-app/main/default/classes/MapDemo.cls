public with sharing class MapDemo {

       /* public static void demo(){

                Map<Integer,String> colors = new Map<Integer,String>();

                Map<Integer, String> morecolors = new Map<Integer, String>();

                colors.put(1,'Red');
                colors.put(2,'Orange');
                colors.put(3,'Black');
                colors.put(3,'Dark');
                colors.put(4,'W1ite');

                morecolors.put(10,'Orange');
                morecolors.put(40,'Black');
                morecolors.put(14,'W1ite');

                colors.putAll(morecolors);

                colors.remove(1);


                System.debug('Size='+colors.size());

                System.debug('Values='+colors.values());

                System.debug('Key='+colors.keySet());


                
                System.debug('Map Contain'+colors);
            }
        
        
            

            public static void subjectDemo(){
                List <Account> accList = new List<Account>();

                List <Account> list1 = new List<Account> ();
                Set <Id> set1 = new Set<ID> ();
                
                Map<Id,Account> IdMap = new Map<Id,Account>();
               
                accList=[SELECT Id,Name,Phone FROM Account LIMIT 5];
               
                IdMap.putAll(accList);
                System.debug('Map COntain =='+IdMap);


                list1 = IdMap.values();

                set1 = IdMap.keySet();


                System.debug('List Contain'+list1);

                System.debug('Set Contain'+set1);

        }
                

                
            */ 
            public static void demo1(){

                List<Account> acclist1 = new List<Account>();

                accList1 =[SELECT Name,Createddate FROM Account LIMIT 5 ];

                //Map<Id,Account> accMap = new Map <Id, Account>(acclist1);

                Map<Id,Account> accMap = new Map <Id, Account>();

                for(Account acc : accList1)
                {
                    accMap.put(acc.id,acc);
                }

                System.debug('Map Contain'+accMap);

                System.debug('Map Keys'+accMap.keySet());

                System.debug('Map ConValuestain'+accMap.values());



                
            }
            
            
            
            
            }