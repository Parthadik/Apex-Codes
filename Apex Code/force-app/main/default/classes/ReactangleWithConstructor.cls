public with sharing class ReactangleWithConstructor {
    Decimal length,breadth;
    public ReactangleWithConstructor(Decimal l,Decimal b)
    {
    length=l;
    breadth=b;
    }
     
 
            public void area()
                {
                    decimal a=length*breadth;
                    system.debug('Area='+a);
                }
            public void perimeter()
                {
                 decimal p=2*(length*breadth);
                    system.debug('Perimeter='+p);
                }
        }