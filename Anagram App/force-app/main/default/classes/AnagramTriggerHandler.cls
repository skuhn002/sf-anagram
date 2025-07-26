public class AnagramTriggerHandler {
    public static void setSinglePuzzle(anagram__Anagram__c anagram){
        anagram.anagram__Puzzle__c = '';
        String puzzle = '';
        List<String> words = anagram.anagram__Solution__c.split(' ');
        System.debug(words);
        
        Integer indicesToLastWord = words.size() - 1;
        for(String word : words){
            System.debug('Indices To Last Word: ' + indicesToLastWord);
            if(indicesToLastWord != 0){
				anagram.anagram__Puzzle__c += AnagramTriggerHandler.rearrangeWord(word) + ' ';   
            } else {
				anagram.anagram__Puzzle__c += AnagramTriggerHandler.rearrangeWord(word);   
            }
            indicesToLastWord --;
        }
        
        System.debug('Sam Test 2: ' + anagram.anagram__Puzzle__c);
    }
    
    public static String rearrangeWord(String word) {
        if (String.isBlank(word)) {
            return '';
        }
        List<String> chars = word.split('');
        List<String> remaining = new List<String>(chars);
        String shuffled = '';
        while (!remaining.isEmpty()) {
            Integer randomIndex = (Integer)(Math.random() * remaining.size());
            shuffled += remaining[randomIndex];
            remaining.remove(randomIndex);
        }
        return shuffled.toUpperCase();
    }
}