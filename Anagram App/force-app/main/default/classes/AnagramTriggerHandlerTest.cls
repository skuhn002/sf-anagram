@isTest
public class AnagramTriggerHandlerTest {
	@isTest
    public static void test1(){
        String testSolution = 'Another Test Solution';
        anagram__Anagram__c anagram = new anagram__Anagram__c(Name='Test', anagram__Solution__c=testSolution);
        insert anagram;
        
        anagram = [
            SELECT Name, anagram__Solution__c
        	FROM anagram__Anagram__c
            WHERE Name = 'Test'
        ];
        
        Assert.isTrue(testSolution != anagram.anagram__Puzzle__c, 'Solution was not rearranged');
    }
}