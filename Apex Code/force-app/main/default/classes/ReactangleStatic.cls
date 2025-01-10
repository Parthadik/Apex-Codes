public with sharing class ReactangleStatic {
    
        public static void area()
        {
            Decimal length=5,breadth=6;
            decimal a=length*breadth;
            system.debug('Area='+a);
        }
        public static void perimeter()
        {
            Decimal length=5,breadth=6;
            decimal p=2*(length*breadth);
            system.debug('Perimeter='+p);

    }

    }