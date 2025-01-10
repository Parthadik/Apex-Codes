public with sharing class DemoList {

    public static void listMethod(){
    List <String> colors=new List<String> ();
    colors.add('Red');
    colors.add('Orange');
    colors.add('Black');
    colors.add('White');
    System.debug('List Contain'+colors);
    
    colors.add(1,'Dark');
    System.debug('List Contain'+colors);
    
    List <String> parth=new List<String> ();
    
    parth.add('Pink');
    parth.add('Purple');
    colors.addAll(parth);
    
    System.debug('List Contain'+colors);
    
    List <String> newclone = new List<String>{'BLACK','WHITE','GOLD'};
    //newclone =colors.clone();
    System.debug('List Contain=='+colors.contains('RRed'));

    System.debug('List Contain=='+colors.equals(colors));

    System.debug('List Contain=='+newclone.get(1));

    System.debug('List Contain=='+newclone.indexOf('GOLD'));

    System.debug('Empty=='+colors.isEmpty());

    List <String> demo = new List<String>();

    System.debug('Empty=='+demo.isEmpty());

    System.debug('List Contain=='+colors);

    colors.remove(3);

    System.debug('List Contain=='+colors);

    System.debug('size check=='+colors.size());

    System.debug('size check=='+newclone.size());

    System.debug('List Contain=='+colors);

    colors.sort();

    System.debug('List Contain=='+colors);

    

    
    
    } 
    
}