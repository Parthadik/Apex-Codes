@isTest
public with sharing class TestVerifyDate {
    
    
    
        @isTest
        static void testCheckDatesWithin30Days() {
            // Test case where date2 is within 30 days of date1
            Date date1 = Date.newInstance(2024, 11, 1); // Nov 1, 2024
            Date date2 = Date.newInstance(2024, 11, 15); // Nov 15, 2024 (within 30 days)
    
            // Call the method
            Test.startTest();
            Date result = verifyDate.CheckDates(date1, date2);
            Test.stopTest();
    
            // Assert that the result is date2, because it is within 30 days
            System.assertEquals(result, date2, 'The result should be date2 since it is within 30 days of date1');
        }
    
        @isTest
        static void testCheckDatesMoreThan30Days() {
            // Test case where date2 is more than 30 days from date1
            Date date1 = Date.newInstance(2024, 11, 1); // Nov 1, 2024
            Date date2 = Date.newInstance(2024, 12, 10); // Dec 10, 2024 (more than 30 days)
    
            // Call the method
            Test.startTest();
            Date result = verifyDate.CheckDates(date1, date2);
            Test.stopTest();
    
            // The expected result is the end of the month of date1 (Nov 30, 2024)
            Date expectedEndOfMonth = Date.newInstance(2024, 11, 30);
            System.assertEquals(result, expectedEndOfMonth, 'The result should be the end of the month (Nov 30, 2024)');
        }
    
        @isTest
        static void testCheckDatesEdgeCases() {
            // Test case where date2 is exactly the same as date1
            Date date1 = Date.newInstance(2024, 11, 1); // Nov 1, 2024
            Date date2 = Date.newInstance(2024, 11, 1); // Same as date1
    
            // Call the method
            Test.startTest();
            Date result = verifyDate.CheckDates(date1, date2);
            Test.stopTest();
    
            // The result should be date2 since it's the same as date1
            System.assertEquals(result, date2, 'The result should be date2 when date2 is the same as date1');
    
            // Test case where date2 is in the past
            date2 = Date.newInstance(2024, 10, 15); // Oct 15, 2024 (before date1)
    
            // Call the method
            Test.startTest();
            result = verifyDate.CheckDates(date1, date2);
            Test.stopTest();
    
            // The result should be the end of the month of date1 (Nov 30, 2024)
            Date expectedEndOfMonth = Date.newInstance(2024, 11, 30);
            System.assertEquals(result, expectedEndOfMonth, 'The result should be the end of the month when date2 is in the past');
    
            // Test case where date2 is exactly 30 days later than date1
            date2 = Date.newInstance(2024, 12, 1); // Dec 1, 2024 (exactly 30 days later)
    
            // Call the method
            Test.startTest();
            result = verifyDate.CheckDates(date1, date2);
            Test.stopTest();
    
            // The result should be the end of the month of date1 (Nov 30, 2024)
            expectedEndOfMonth = Date.newInstance(2024, 11, 30);
            System.assertEquals(result, expectedEndOfMonth, 'The result should be the end of the month when date2 is exactly 30 days later');
        }
    }