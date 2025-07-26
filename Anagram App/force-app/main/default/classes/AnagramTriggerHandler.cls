public class AnagramTriggerHandler {
    public static void setSinglePuzzle(anagram__Anagram__c anagram){
        anagram.anagram__Puzzle__c = '';
        String puzzle = '';
        List<String> words = anagram.anagram__Solution__c.split(' ');
        
        Integer indicesToLastWord = words.size() - 1;
        for(String word : words){
            if(indicesToLastWord != 0){
				anagram.anagram__Puzzle__c += AnagramTriggerHandler.rearrangeWord(word) + ' ';   
            } else {
				anagram.anagram__Puzzle__c += AnagramTriggerHandler.rearrangeWord(word);   
            }
            indicesToLastWord --;
        }
        System.debug(anagram.anagram__Puzzle__c);
    }
    
    public static String rearrangeWord(String word) {
        String shuffled = '';
        do{
            if (String.isBlank(word)) {
                return '';
            }
            shuffled = '';
            List<String> chars = word.split('');
            List<String> remaining = new List<String>(chars);
            while (!remaining.isEmpty()) {
                Integer randomIndex = (Integer)(Math.random() * remaining.size());
                shuffled += remaining[randomIndex];
                remaining.remove(randomIndex);
            }
    	} while(word == shuffled);
        
        return shuffled.toUpperCase();
    }
}