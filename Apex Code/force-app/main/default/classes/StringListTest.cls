public with sharing class StringListTest {

    /*public static void generateStringList(Integer numberOfString){

        List<String> resultList = new List<String>();

        for(Integer i = 0; i < numberOfString; i++ ){

            resultList.add('test' +i);

        }

        return resultList;

    }*/


   
        public static List<String> generateStringList(Integer numberOfStrings) {
            List<String> resultList = new List<String>();
            
            for (Integer i = 0; i < numberOfStrings; i++) {
                resultList.add('Test ' + i);
            }
            
            return resultList;
        }
    }