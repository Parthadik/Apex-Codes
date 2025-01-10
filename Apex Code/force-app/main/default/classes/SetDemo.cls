public with sharing class SetDemo {

        public static void demo()
        {

        Set<Integer> newSet = new Set <Integer>();
        List<Integer> newList= new List <Integer>();

        List<Integer> set2= new List <Integer>();



        newSet.add(20);

        newSet.add(30);

        newSet.add(40);

        newSet.add(50);

        newSet.add(20);

        newSet.add(50);

        newList.add(70);
        newList.add(80);
        newList.add(20);
        newList.add(30);


        //set2.add(65);
        //set2.add(75);

        //newSet.addAll(set2);

       // system.debug('Index Value='+ set2.get(1));

        
        //system.debug('Index Value=='+newSet);


        System.debug('Set Value='+newSet);
        System.debug('List Value='+newList);

        //newSet.removeAll(newList);

        newSet.retainAll(newList);

        System.debug('Set Value='+newSet);
        System.debug('List Value='+newList);

        System.debug('Size Of Set'+newList.size()); 


        
        }
    
    }